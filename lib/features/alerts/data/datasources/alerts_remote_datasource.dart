import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../models/alert.dart';

part 'alerts_remote_datasource.g.dart';

/// Gọi thẳng API backend qua Dio. Chỉ repository được phép gọi class này.
class AlertsRemoteDatasource {
  AlertsRemoteDatasource(this._apiClient);

  final Dio _apiClient;

  Future<List<Alert>> getAlerts() async {
    final response = await _apiClient.get('/alerts');
    final data = response.data as Map<String, dynamic>;
    final alerts = data['alerts'] as List<dynamic>;

    return alerts
        .map((json) => Alert.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

@Riverpod(keepAlive: true)
AlertsRemoteDatasource alertsRemoteDatasource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AlertsRemoteDatasource(apiClient);
}
