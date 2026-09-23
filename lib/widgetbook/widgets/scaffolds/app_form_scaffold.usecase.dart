import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/inputs/app_text_field.dart';
import '../../../shared/widgets/scaffolds/app_form_scaffold.dart';

@widgetbook.UseCase(name: 'Default', type: AppFormScaffold)
Widget buildAppFormScaffoldUseCase(BuildContext context) {
  return AppFormScaffold(
    title: 'Đăng nhập',
    submitLabel: 'Đăng nhập',
    onSubmit: () {},
    fields: const [
      AppTextField(label: 'Email'),
      AppTextField(label: 'Mật khẩu', obscureText: true),
    ],
  );
}

@widgetbook.UseCase(name: 'Với lỗi', type: AppFormScaffold)
Widget buildAppFormScaffoldErrorUseCase(BuildContext context) {
  return AppFormScaffold(
    title: 'Đăng nhập',
    submitLabel: 'Đăng nhập',
    onSubmit: () {},
    errorMessage: 'Sai email hoặc mật khẩu',
    fields: const [
      AppTextField(label: 'Email'),
      AppTextField(label: 'Mật khẩu', obscureText: true),
    ],
  );
}

@widgetbook.UseCase(name: 'Đang submit', type: AppFormScaffold)
Widget buildAppFormScaffoldSubmittingUseCase(BuildContext context) {
  return AppFormScaffold(
    title: 'Đăng nhập',
    submitLabel: 'Đăng nhập',
    onSubmit: () {},
    isSubmitting: true,
    fields: const [
      AppTextField(label: 'Email', enabled: false),
      AppTextField(label: 'Mật khẩu', obscureText: true, enabled: false),
    ],
  );
}
