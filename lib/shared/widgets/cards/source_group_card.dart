import 'package:flutter/material.dart';

import '../list_items/log_list_item.dart';
import 'app_card.dart';

/// 1 log/thông báo bên trong 1 nhóm nguồn — dữ liệu thuần, SourceGroupCard
/// tự dựng thành LogListItem khi hiển thị.
class SourceLogEntry {
  const SourceLogEntry({
    required this.title,
    required this.time,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String time;
  final String? subtitle;
  final VoidCallback? onTap;
}

/// Thẻ nhóm nhiều log theo 1 nguồn — giống notification group của iOS:
/// icon nguồn + tên nguồn + preview 1-2 log đầu + "+N khác", bấm vào để
/// mở rộng xem toàn bộ log bên trong (dựng bằng LogListItem, component
/// riêng biệt không liên quan AlertListItem).
///
/// Đúng bài toán SIEM: 1 nguồn (Firewall, WAF...) có thể phát sinh nhiều
/// log trong ngày — gộp lại 1 card thay vì liệt kê từng dòng rời rạc.
class SourceGroupCard extends StatefulWidget {
  const SourceGroupCard({
    super.key,
    required this.sourceIcon,
    required this.sourceName,
    required this.entries,
    this.collapsedPreviewCount = 2,
  });

  final IconData sourceIcon;
  final String sourceName;
  final List<SourceLogEntry> entries;
  final int collapsedPreviewCount;

  @override
  State<SourceGroupCard> createState() => _SourceGroupCardState();
}

class _SourceGroupCardState extends State<SourceGroupCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final visibleEntries = _expanded
        ? widget.entries
        : widget.entries.take(widget.collapsedPreviewCount).toList();
    final hiddenCount = widget.entries.length - visibleEntries.length;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
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
                    widget.sourceName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  '${widget.entries.length} thông báo',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          for (final entry in visibleEntries)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: LogListItem(
                sourceIcon: widget.sourceIcon,
                title: entry.title,
                subtitle: entry.subtitle,
                time: entry.time,
                onTap: entry.onTap,
              ),
            ),
          if (hiddenCount > 0 || _expanded)
            TextButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: Text(_expanded ? 'Thu gọn' : '+$hiddenCount thông báo khác'),
            ),
        ],
      ),
    );
  }
}
