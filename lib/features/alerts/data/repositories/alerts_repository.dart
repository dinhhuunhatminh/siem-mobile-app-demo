import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/alerts_remote_datasource.dart';
import '../models/alert.dart';

part 'alerts_repository.g.dart';

/// Duy nhất lớp này được gọi từ presentation/state — không gọi thẳng
/// datasource ở đó.
class AlertsRepository {
  AlertsRepository(this._remoteDatasource);

  final AlertsRemoteDatasource _remoteDatasource;

  Future<List<Alert>> getAlerts() => _remoteDatasource.getAlerts();
}

@Riverpod(keepAlive: true)
AlertsRepository alertsRepository(Ref ref) {
  final remoteDatasource = ref.watch(alertsRemoteDatasourceProvider);
  return AlertsRepository(remoteDatasource);
}
