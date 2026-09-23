import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../models/dashboard_summary.dart';

part 'dashboards_remote_datasource.g.dart';

/// Gọi thẳng API backend qua Dio. Chỉ repository được phép gọi class này.
class DashboardsRemoteDatasource {
  DashboardsRemoteDatasource(this._apiClient);

  final Dio _apiClient;

  Future<DashboardSummary> getSummary() async {
    final response = await _apiClient.get('/dashboards/summary');
    return DashboardSummary.fromJson(response.data as Map<String, dynamic>);
  }
}

@Riverpod(keepAlive: true)
DashboardsRemoteDatasource dashboardsRemoteDatasource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return DashboardsRemoteDatasource(apiClient);
}
