import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/states/error_state_view.dart';

@widgetbook.UseCase(name: 'Với nút Thử lại', type: ErrorStateView)
Widget buildErrorStateViewWithRetryUseCase(BuildContext context) {
  return SizedBox(
    height: 300,
    child: ErrorStateView(
      message: 'Không kết nối được tới server',
      onRetry: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Không có nút Thử lại', type: ErrorStateView)
Widget buildErrorStateViewNoRetryUseCase(BuildContext context) {
  return const SizedBox(
    height: 300,
    child: ErrorStateView(message: 'Bạn không có quyền xem nội dung này'),
  );
}
