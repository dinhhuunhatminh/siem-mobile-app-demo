import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/app_config_provider.dart';
import '../storage/secure_token_storage.dart';
import 'auth_interceptor.dart';

part 'api_client.g.dart';

/// Instance Dio duy nhất dùng chung toàn app, nơi khác lấy qua ref.watch,
/// không tự khởi tạo Dio() riêng ở bất kỳ đâu khác.
@Riverpod(keepAlive: true)
Dio apiClient(Ref ref) {
  final config = ref.watch(appConfigProvider);
  final tokenStorage = ref.watch(secureTokenStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(AuthInterceptor(tokenStorage));

  return dio;
}
