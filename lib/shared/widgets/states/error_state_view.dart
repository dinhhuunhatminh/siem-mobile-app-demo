import 'package:flutter/material.dart';

import '../buttons/app_button.dart';

/// Hiện khi gọi API lỗi. Khác EmptyStateView ở màu error + nút "Thử lại"
/// (onRetry null thì ẩn nút — dùng được cho trường hợp không cần retry).
class ErrorStateView extends StatelessWidget {
  const ErrorStateView({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 56,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              AppButton(label: 'Thử lại', onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
