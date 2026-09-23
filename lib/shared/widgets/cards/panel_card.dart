import 'package:flutter/material.dart';

import 'app_card.dart';

/// Khung panel dùng cho mọi widget trong dashboard (bảng, biểu đồ, danh
/// sách...) — header cố định (title + optional icon mở rộng/menu), phần
/// thân nhận child tùy ý. Dùng lại AppCard làm khung ngoài.
class PanelCard extends StatelessWidget {
  const PanelCard({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.onExpand,
    this.onMore,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final VoidCallback? onExpand;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleMedium),
                      if (subtitle != null)
                        Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                if (onExpand != null)
                  IconButton(
                    icon: const Icon(Icons.open_in_full, size: 18),
                    onPressed: onExpand,
                  ),
                if (onMore != null)
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: onMore,
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
