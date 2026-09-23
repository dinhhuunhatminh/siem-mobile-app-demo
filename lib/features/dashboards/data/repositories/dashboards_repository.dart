import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/dashboards_remote_datasource.dart';
import '../models/dashboard_summary.dart';

part 'dashboards_repository.g.dart';

/// Duy nhất lớp này được gọi từ presentation/state — không gọi thẳng
/// datasource ở đó.
class DashboardsRepository {
  DashboardsRepository(this._remoteDatasource);

  final DashboardsRemoteDatasource _remoteDatasource;

  Future<DashboardSummary> getSummary() => _remoteDatasource.getSummary();
}

@Riverpod(keepAlive: true)
DashboardsRepository dashboardsRepository(Ref ref) {
  final remoteDatasource = ref.watch(dashboardsRemoteDatasourceProvider);
  return DashboardsRepository(remoteDatasource);
}
