import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/inputs/app_text_field.dart';
import '../../../../shared/widgets/scaffolds/app_form_scaffold.dart';
import '../state/login_form_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(loginFormControllerProvider);

    return AppFormScaffold(
      title: 'Đăng nhập',
      isSubmitting: formState.isSubmitting,
      errorMessage: formState.errorMessage,
      submitLabel: 'Đăng nhập',
      onSubmit: _submit,
      fields: [
        AppTextField(
          label: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          enabled: !formState.isSubmitting,
        ),
        AppTextField(
          label: 'Mật khẩu',
          controller: _passwordController,
          obscureText: true,
          enabled: !formState.isSubmitting,
        ),
      ],
    );
  }

  void _submit() {
    ref.read(loginFormControllerProvider.notifier).submit(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }
}
