import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import '../buttons/app_button.dart';
import 'app_scaffold.dart';

/// Biến thể AppScaffold cho màn hình dạng form — chuẩn hóa đúng cấu trúc
/// lặp lại ở LoginScreen: các field xếp dọc, khoảng cách đều, vùng lỗi
/// phía trên nút submit, nút submit tự disable/hiện loading khi
/// isSubmitting. Field cụ thể (AppTextField...) do feature tự cung cấp
/// qua fields, form này không biết gì về nội dung của chúng.
class AppFormScaffold extends StatelessWidget {
  const AppFormScaffold({
    super.key,
    required this.title,
    required this.fields,
    required this.submitLabel,
    required this.onSubmit,
    this.isSubmitting = false,
    this.errorMessage,
  });

  final String title;
  final List<Widget> fields;
  final String submitLabel;
  final VoidCallback onSubmit;
  final bool isSubmitting;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final field in fields) ...[
              field,
              const SizedBox(height: AppSpacing.md),
            ],
            if (errorMessage != null) ...[
              Text(
                errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
            AppButton(
              label: submitLabel,
              onPressed: onSubmit,
              isLoading: isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}
