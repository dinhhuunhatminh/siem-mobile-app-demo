import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/alert.dart';
import '../../data/repositories/alerts_repository.dart';

part 'alerts_controller.g.dart';

/// 1 nhóm alert theo nguồn — dữ liệu đã group-by sẵn ở tầng state, UI chỉ
/// việc dựng SourceGroupCard từ đây, không tự group trong widget.
class AlertSourceGroup {
  const AlertSourceGroup({required this.sourceName, required this.alerts});

  final String sourceName;
  final List<Alert> alerts;
}

/// Sở hữu danh sách alert gốc + bộ lọc severity đang chọn. UI chỉ đọc
/// `filteredGroups` (đã lọc + group sẵn) và gọi `toggleSeverity`.
@riverpod
class AlertsController extends _$AlertsController {
  List<Alert> _allAlerts = [];

  @override
  Future<Set<AlertSeverity>> build() async {
    final repository = ref.read(alertsRepositoryProvider);
    _allAlerts = await repository.getAlerts();
    // Mặc định không lọc gì — hiện toàn bộ alert.
    return {};
  }

  void toggleSeverity(AlertSeverity severity) {
    final current = state.value ?? {};
    final next = Set<AlertSeverity>.from(current);
    next.contains(severity) ? next.remove(severity) : next.add(severity);
    state = AsyncData(next);
  }

  /// Danh sách alert sau khi lọc theo severity đang chọn — trống thì coi
  /// như không lọc (hiện tất cả).
  List<Alert> get filteredAlerts {
    final selectedSeverities = state.value ?? {};
    if (selectedSeverities.isEmpty) return _allAlerts;
    return _allAlerts.where((a) => selectedSeverities.contains(a.severity)).toList();
  }

  /// Alert đã lọc, nhóm theo sourceName — thứ tự nhóm theo lần xuất hiện
  /// đầu tiên trong danh sách gốc.
  List<AlertSourceGroup> get filteredGroups {
    final filtered = filteredAlerts;
    final order = <String>[];
    final grouped = <String, List<Alert>>{};

    for (final alert in filtered) {
      grouped.putIfAbsent(alert.sourceName, () {
        order.add(alert.sourceName);
        return [];
      }).add(alert);
    }

    return [for (final name in order) AlertSourceGroup(sourceName: name, alerts: grouped[name]!)];
  }
}
