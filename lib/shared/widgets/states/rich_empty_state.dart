import 'package:flutter/material.dart';

import '../buttons/app_button.dart';

/// Biến thể phong phú của EmptyStateView — dùng cho lần đầu vào 1 feature
/// (chưa có dữ liệu vì chưa từng thiết lập gì, không phải "danh sách rỗng"
/// thông thường). Có illustration, tiêu đề, danh sách bước hướng dẫn, và
/// 1 nút CTA — khác EmptyStateView (chỉ icon nhỏ + 1 dòng text).
class RichEmptyState extends StatelessWidget {
  const RichEmptyState({
    super.key,
    required this.illustration,
    required this.title,
    required this.steps,
    required this.ctaLabel,
    required this.onCtaPressed,
  });

  final Widget illustration;
  final String title;
  final List<String> steps;
  final String ctaLabel;
  final VoidCallback onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            illustration,
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < steps.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '${i + 1}. ${steps[i]}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            AppButton(label: ctaLabel, onPressed: onCtaPressed),
          ],
        ),
      ),
    );
  }
}
