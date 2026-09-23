import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/search_dialog/search_dialog.dart';

const _sampleItems = [
  'Firewall - Chi nhánh Hà Nội',
  'SIEM - Trung tâm dữ liệu',
  'SOAR - Phòng vận hành',
  'WAF - Cổng ứng dụng web',
  'NAC - Kiểm soát truy cập mạng',
];

/// SearchDialog cần context để show() — use case này bọc 1 nút bấm để
/// mở dialog, thay vì hiện thẳng dialog ngay khi vào trang (gây phiền
/// vì Widgetbook rebuild use case liên tục lúc đổi theme/viewport).
@widgetbook.UseCase(name: 'Default', type: SearchDialog)
Widget buildSearchDialogUseCase(BuildContext context) {
  return _OpenDialogButton(items: _sampleItems);
}

@widgetbook.UseCase(name: 'Danh sách rỗng', type: SearchDialog)
Widget buildSearchDialogEmptyUseCase(BuildContext context) {
  return const _OpenDialogButton(items: []);
}

class _OpenDialogButton extends StatelessWidget {
  const _OpenDialogButton({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () async {
          final selected = await SearchDialog.show(
            context,
            title: 'Tìm hệ thống',
            items: items,
          );
          if (context.mounted && selected != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Đã chọn: $selected')),
            );
          }
        },
        child: const Text('Mở SearchDialog'),
      ),
    );
  }
}
