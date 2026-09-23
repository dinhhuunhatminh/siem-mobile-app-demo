import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/states/empty_state_view.dart';

@widgetbook.UseCase(name: 'Default', type: EmptyStateView)
Widget buildEmptyStateViewUseCase(BuildContext context) {
  return const SizedBox(
    height: 300,
    child: EmptyStateView(message: 'Chưa có cảnh báo nào'),
  );
}
