import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/dashboard_summary.dart';
import '../../data/repositories/dashboards_repository.dart';

part 'dashboards_controller.g.dart';

/// Chỉ đọc + hiển thị — không có bộ lọc/tương tác nào làm đổi state như
/// AlertsController, nên FutureProvider đơn giản là đủ, không cần
/// AsyncNotifier riêng.
@riverpod
Future<DashboardSummary> dashboardsSummary(Ref ref) {
  final repository = ref.read(dashboardsRepositoryProvider);
  return repository.getSummary();
}
