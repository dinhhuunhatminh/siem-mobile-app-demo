import 'package:flutter/material.dart';

/// Bỏ dấu tiếng Việt để so khớp tìm kiếm không phân biệt dấu — người
/// dùng gõ nhanh trên điện thoại thường bỏ dấu (vd "quet" thay vì "quét").
/// Không dùng package ngoài vì chỉ cần đúng 1 việc nhỏ này.
String _removeVietnameseDiacritics(String input) {
  const withDiacritics =
      'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ'
      'ÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ';
  const withoutDiacritics =
      'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd'
      'AAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYD';

  final buffer = StringBuffer();
  for (final char in input.characters) {
    final index = withDiacritics.indexOf(char);
    buffer.write(index == -1 ? char : withoutDiacritics[index]);
  }
  return buffer.toString();
}

/// Chuẩn hóa chuỗi để so khớp: bỏ dấu + viết thường.
String normalizeForSearch(String input) => _removeVietnameseDiacritics(input).toLowerCase();

/// Dialog tìm kiếm trong 1 danh sách có sẵn (lọc client-side theo từ khóa
/// gõ vào, không phân biệt hoa/thường và không phân biệt dấu tiếng Việt).
/// Không gọi API — nơi dùng tự truyền items đã có, hoặc tự gọi API trước
/// rồi mới show dialog này.
///
/// Dùng qua hàm tĩnh show(), giống showDialog() của Flutter, trả về item
/// được chọn hoặc null nếu người dùng đóng dialog mà không chọn gì.
class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  static Future<String?> show(
    BuildContext context, {
    required String title,
    required List<String> items,
  }) {
    return showDialog<String>(
      context: context,
      builder: (context) => SearchDialog(title: title, items: items),
    );
  }

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  late List<String> _filteredItems = widget.items;

  void _onQueryChanged(String query) {
    final normalizedQuery = normalizeForSearch(query);
    setState(() {
      _filteredItems = widget.items
          .where((item) => normalizeForSearch(item).contains(normalizedQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Tìm kiếm...',
              ),
              onChanged: _onQueryChanged,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: _filteredItems.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text('Không tìm thấy kết quả'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return ListTile(
                          title: Text(item),
                          onTap: () => Navigator.of(context).pop(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
      ],
    );
  }
}
