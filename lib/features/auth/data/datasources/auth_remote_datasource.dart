import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../models/login_response.dart';

part 'auth_remote_datasource.g.dart';

/// Gọi thẳng API backend qua Dio. Chỉ repository được phép gọi class này.
class AuthRemoteDatasource {
  AuthRemoteDatasource(this._apiClient);

  final Dio _apiClient;

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    return LoginResponse.fromJson(response.data as Map<String, dynamic>);
  }
}

@Riverpod(keepAlive: true)
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDatasource(apiClient);
}
