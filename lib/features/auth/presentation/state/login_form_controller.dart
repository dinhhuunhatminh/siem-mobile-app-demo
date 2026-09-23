import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/auth/auth_controller.dart';

part 'login_form_controller.g.dart';

/// State riêng của màn login (loading/error khi bấm nút) — khác với
/// AuthState toàn app. Không feature nào khác cần đọc state này nên
/// nó nằm trong features/auth/presentation/state, không phải core/auth.
class LoginFormState {
  const LoginFormState({this.isSubmitting = false, this.errorMessage});

  final bool isSubmitting;
  final String? errorMessage;

  LoginFormState copyWith({bool? isSubmitting, String? errorMessage}) {
    return LoginFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}

@riverpod
class LoginFormController extends _$LoginFormController {
  @override
  LoginFormState build() => const LoginFormState();

  Future<void> submit({required String email, required String password}) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      await ref.read(authControllerProvider.notifier).login(
            email: email,
            password: password,
          );
      state = state.copyWith(isSubmitting: false);
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: _messageFromError(e),
      );
    }
  }

  String _messageFromError(Object error) {
    if (error is DioException) {
      final serverMessage = error.response?.data is Map
          ? (error.response?.data as Map)['message'] as String?
          : null;
      if (serverMessage != null) return serverMessage;

      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout) {
        return 'Không kết nối được tới server. Kiểm tra lại mạng.';
      }
    }
    return 'Đăng nhập thất bại. Vui lòng thử lại.';
  }
}
