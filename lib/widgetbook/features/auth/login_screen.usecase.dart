import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../features/auth/presentation/screens/login_screen.dart';

/// Use case đầu tiên — kiểm chứng pipeline Widgetbook hoạt động, dùng
/// ngay LoginScreen đã có sẵn thay vì tạo component mới. Bọc ProviderScope
/// vì LoginScreen cần ref.watch(loginFormControllerProvider).
@widgetbook.UseCase(name: 'Default', type: LoginScreen)
Widget buildLoginScreenUseCase(BuildContext context) {
  return const ProviderScope(child: LoginScreen());
}
