import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/inputs/app_text_field.dart';

@widgetbook.UseCase(name: 'Default', type: AppTextField)
Widget buildAppTextFieldDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppTextField(label: 'Email'),
  );
}

@widgetbook.UseCase(name: 'Password (toggle con mắt)', type: AppTextField)
Widget buildAppTextFieldPasswordUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppTextField(label: 'Mật khẩu', obscureText: true),
  );
}

@widgetbook.UseCase(name: 'Error', type: AppTextField)
Widget buildAppTextFieldErrorUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppTextField(label: 'Email', errorText: 'Email không hợp lệ'),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AppTextField)
Widget buildAppTextFieldDisabledUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppTextField(label: 'Email', enabled: false),
  );
}
