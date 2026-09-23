import 'package:dio/dio.dart';

import '../storage/secure_token_storage.dart';

/// Tự gắn access token vào header Authorization của mọi request.
///
/// Đặt trong core/network vì đây là hành vi của tầng networking,
/// dù dữ liệu (token) được đọc từ core/storage.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final SecureTokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStorage.readAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }
}
