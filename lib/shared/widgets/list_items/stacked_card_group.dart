import 'package:flutter/material.dart';

import '../cards/source_group_card.dart' show SourceLogEntry;
import 'log_list_item.dart';

/// Nhóm log theo 1 nguồn — lúc thu gọn chỉ hiện 1 log mới nhất (che kín,
/// không có hiệu ứng xếp chồng lộ mép), số lượng còn lại hiện ngay trong
/// header (sourceName kèm "(N)"). Bấm nút "Xem thêm" ở header để giãn ra
/// xem đầy đủ. Cùng vai trò với SourceGroupCard (nhóm theo nguồn, cùng
/// nhận `List<SourceLogEntry>`) nhưng SourceGroupCard vẫn giữ khung
/// AppCard bao ngoài + preview nhiều dòng hơn, StackedCardGroup thì không.
///
/// Nút mở/thu gọn đặt RIÊNG ở header (không phải cả card) — vì LogListItem
/// con luôn nhận onTap riêng để xem chi tiết (kể cả lúc thu gọn), nếu để
/// cả card cũng là vùng bấm sẽ xung đột hit-test với log con.
class StackedCardGroup extends StatefulWidget {
  const StackedCardGroup({
    super.key,
    required this.sourceIcon,
    required this.sourceName,
    required this.entries,
    this.itemSpacing = 8,
  });

  final IconData sourceIcon;
  final String sourceName;
  final List<SourceLogEntry> entries;
  final double itemSpacing;

  @override
  State<StackedCardGroup> createState() => _StackedCardGroupState();
}

class _StackedCardGroupState extends State<StackedCardGroup> {
  bool _expanded = false;

  List<Widget> _buildItems() => [
        for (final entry in widget.entries)
          LogListItem(
            sourceIcon: widget.sourceIcon,
            title: entry.title,
            subtitle: entry.subtitle,
            time: entry.time,
            onTap: entry.onTap,
          ),
      ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final header = Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(widget.sourceIcon, size: 16, color: colorScheme.onPrimaryContainer),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${widget.sourceName} (${widget.entries.length})',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          TextButton.icon(
            onPressed: () => setState(() => _expanded = !_expanded),
            icon: AnimatedRotation(
              turns: _expanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.expand_more, size: 18),
            ),
            label: Text(_expanded ? 'Ẩn bớt' : 'Xem thêm'),
          ),
        ],
      ),
    );

    final body = Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: _expanded ? _buildExpanded() : _buildCollapsed(),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, body],
    );
  }

  Widget _buildExpanded() {
    final items = _buildItems();
    return Column(
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : widget.itemSpacing),
            child: items[i],
          ),
      ],
    );
  }

  Widget _buildCollapsed() {
    final items = _buildItems();
    if (items.isEmpty) return const SizedBox.shrink();
    return items.first;
  }
}
