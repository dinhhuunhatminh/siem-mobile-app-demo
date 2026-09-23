import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';

/// Bảng dữ liệu chuẩn — nhận số cột/hàng tùy ý qua columns/rows, chỉ cố
/// định phần FORMAT (header tô nền, hàng có viền phân cách) để mọi bảng
/// trong app trông giống nhau dù nội dung khác nhau (EVENT/TIME hôm nay,
/// cột khác cho feature khác sau này).
class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<String> columns;
  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: colorScheme.outlineVariant),
        ),
        columnWidths: const {},
        children: [
          TableRow(
            decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
            children: columns
                .map(
                  (label) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                )
                .toList(),
          ),
          for (final row in rows)
            TableRow(
              children: row
                  .map(
                    (cell) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Text(cell, style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
