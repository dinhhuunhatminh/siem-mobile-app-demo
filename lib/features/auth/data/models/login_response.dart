import '../../../../shared/models/user.dart';

/// Hình dạng response trả về từ endpoint POST /auth/login (mock).
///
/// accessToken: dùng gắn vào header Authorization, sống ngắn hạn.
/// refreshToken: dùng xin cấp lại accessToken khi hết hạn, sống dài hạn.
class LoginResponse {
  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String accessToken;
  final String refreshToken;
  final User user;
}
