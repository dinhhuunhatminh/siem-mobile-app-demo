import 'package:flutter/material.dart';

import 'app_card.dart';

/// Chiều biến động — quyết định màu + icon mũi tên, không nhận Color/Icon
/// tùy ý để mọi StatCard trong app dùng chung 1 quy ước (tăng = xanh lá,
/// giảm = đỏ).
enum StatTrend { up, down, none }

/// Thẻ số liệu lớn (KPI) kèm nhãn + mũi tên biến động — dùng lại AppCard
/// làm khung ngoài, chỉ thêm bố cục riêng cho số liệu.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.trend = StatTrend.none,
    this.trendValue,
  });

  final String label;
  final String value;
  final StatTrend trend;
  final String? trendValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final trendColor = switch (trend) {
      StatTrend.up => Colors.green,
      StatTrend.down => colorScheme.error,
      StatTrend.none => colorScheme.outline,
    };
    final trendIcon = switch (trend) {
      StatTrend.up => Icons.arrow_upward,
      StatTrend.down => Icons.arrow_downward,
      StatTrend.none => null,
    };

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: Theme.of(context).textTheme.displaySmall),
              if (trendIcon != null && trendValue != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(trendIcon, size: 16, color: trendColor),
                      Text(
                        trendValue!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: trendColor),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
