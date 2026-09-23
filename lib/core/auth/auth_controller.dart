import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/data/repositories/auth_repository.dart';
import 'auth_state.dart';

part 'auth_controller.g.dart';

/// Sở hữu AuthState toàn app. features/auth/presentation chỉ ref.watch
/// provider này chứ không tự giữ state đăng nhập riêng.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    _restoreSession();
    return const AuthInitial();
  }

  Future<void> _restoreSession() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final hasSession = await repository.hasValidSession();
      if (!hasSession) {
        state = const AuthUnauthenticated();
      }
      // TODO: khi có endpoint /auth/me, gọi để lấy lại User và set
      // AuthAuthenticated ở đây thay vì chỉ dựa vào có token hay không.
    } catch (_) {
      // Không đọc được token đã lưu (thiết bị chưa từng đăng nhập, hoặc
      // secure storage lỗi) -> coi như chưa đăng nhập thay vì kẹt ở
      // AuthInitial mãi mãi.
      state = const AuthUnauthenticated();
    }
  }

  Future<void> login({required String email, required String password}) async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.login(email: email, password: password);
    state = AuthAuthenticated(user);
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AuthUnauthenticated();
  }
}
