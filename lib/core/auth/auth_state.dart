import '../../shared/models/user.dart';

/// Trạng thái đăng nhập toàn app — go_router và mọi feature cần biết
/// "đã đăng nhập chưa" đều đọc từ đây, không tự suy luận riêng.
sealed class AuthState {
  const AuthState();
}

/// Trạng thái ban đầu, chưa xác định được đã đăng nhập hay chưa
/// (đang chờ đọc token đã lưu từ lần mở app trước).
class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.user);

  final User user;
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}
