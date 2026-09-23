import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/buttons/app_button.dart';

@widgetbook.UseCase(name: 'Default', type: AppButton)
Widget buildAppButtonDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton(label: 'Đăng nhập', onPressed: () {}),
  );
}

@widgetbook.UseCase(name: 'Loading', type: AppButton)
Widget buildAppButtonLoadingUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppButton(label: 'Đăng nhập', onPressed: () {}, isLoading: true),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AppButton)
Widget buildAppButtonDisabledUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppButton(label: 'Đăng nhập', onPressed: null),
  );
}
