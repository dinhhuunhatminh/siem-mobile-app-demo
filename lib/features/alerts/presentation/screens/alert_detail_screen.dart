import 'package:flutter/material.dart';

import '../../../../shared/widgets/scaffolds/app_scaffold.dart';
import '../../data/models/alert.dart';

/// Format thủ công thay vì thêm dependency intl chỉ cho 1 chỗ dùng.
String _formatDateTime(DateTime dt) {
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(dt.day)}/${two(dt.month)}/${dt.year} ${two(dt.hour)}:${two(dt.minute)}';
}

class AlertDetailScreen extends StatelessWidget {
  const AlertDetailScreen({super.key, required this.alert});

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppScaffold(
      title: 'Chi tiết cảnh báo',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(alert.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                _SeverityBadge(severity: alert.severity),
                const SizedBox(width: 8),
                Text(alert.sourceName, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              _formatDateTime(alert.timestamp),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
            if (alert.description != null) ...[
              const SizedBox(height: 24),
              Text('Mô tả', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Text(alert.description!, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ],
        ),
      ),
    );
  }
}

class _SeverityBadge extends StatelessWidget {
  const _SeverityBadge({required this.severity});

  final AlertSeverity severity;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (severity) {
      AlertSeverity.high => ('High', Theme.of(context).colorScheme.error),
      AlertSeverity.medium => ('Medium', const Color(0xFFF97316)),
      AlertSeverity.low => ('Low', const Color(0xFFEAB308)),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
