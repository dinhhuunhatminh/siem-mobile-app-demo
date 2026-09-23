import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/secure_token_storage.dart';
import '../../../../shared/models/user.dart';
import '../datasources/auth_remote_datasource.dart';

part 'auth_repository.g.dart';

/// Duy nhất lớp này được gọi từ presentation/state — không gọi thẳng
/// datasource ở đó. Repository điều phối: gọi API rồi lưu token.
class AuthRepository {
  AuthRepository(this._remoteDatasource, this._tokenStorage);

  final AuthRemoteDatasource _remoteDatasource;
  final SecureTokenStorage _tokenStorage;

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDatasource.login(
      email: email,
      password: password,
    );

    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response.user;
  }

  Future<void> logout() async {
    await _tokenStorage.clear();
  }

  Future<bool> hasValidSession() async {
    final accessToken = await _tokenStorage.readAccessToken();
    return accessToken != null;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final remoteDatasource = ref.watch(authRemoteDatasourceProvider);
  final tokenStorage = ref.watch(secureTokenStorageProvider);
  return AuthRepository(remoteDatasource, tokenStorage);
}
