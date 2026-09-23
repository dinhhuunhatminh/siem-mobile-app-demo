import 'package:flutter/material.dart';

/// Nút chính dùng chung — bọc FilledButton, tự xử lý trạng thái loading
/// (disable nút + hiện vòng xoay) thay vì mỗi màn hình tự viết lại logic
/// if/else đó (đã lặp lại y hệt ở LoginScreen trước khi có component này).
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(label),
    );
  }
}
