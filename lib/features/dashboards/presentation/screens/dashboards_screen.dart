import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/cards/panel_card.dart';
import '../../../../shared/widgets/cards/stat_card.dart';
import '../../../../shared/widgets/charts/app_bar_chart.dart';
import '../../../../shared/widgets/charts/app_line_chart.dart';
import '../../../../shared/widgets/charts/app_pie_chart.dart';
import '../../../../shared/widgets/scaffolds/app_scaffold.dart';
import '../../../../shared/widgets/states/error_state_view.dart';
import '../../../../shared/widgets/states/loading_indicator.dart';
import '../../../../shared/widgets/tables/app_data_table.dart';
import '../../../alerts/data/models/alert.dart';
import '../../data/models/dashboard_summary.dart';
import '../state/dashboards_controller.dart';

/// Chỉ XEM — 4 panel tổng hợp từ dữ liệu Alerts, không có tương tác
/// drill-down (đúng quyết định đã chốt, xem CLAUDE.md mục "Dashboards").
class DashboardsScreen extends ConsumerWidget {
  const DashboardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSummary = ref.watch(dashboardsSummaryProvider);

    return AppScaffold(
      title: 'Dashboards',
      padHorizontal: false,
      body: switch (asyncSummary) {
        AsyncLoading() => const LoadingIndicator(),
        AsyncError(:final error) => ErrorStateView(
            message: 'Không tải được dashboard: $error',
            onRetry: () => ref.invalidate(dashboardsSummaryProvider),
          ),
        AsyncData(:final value) => _DashboardContent(summary: value),
      },
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        _SeverityStatsRow(breakdown: summary.severityBreakdown),
        const SizedBox(height: AppSpacing.md),
        PanelCard(
          title: 'Tỷ lệ theo mức độ',
          subtitle: 'Tổng quan hiện tại',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: AppPieChart(
              entries: [
                PieChartEntry(
                  label: 'High',
                  value: (summary.severityBreakdown[AlertSeverity.high] ?? 0).toDouble(),
                  color: Colors.red.shade400,
                ),
                PieChartEntry(
                  label: 'Medium',
                  value: (summary.severityBreakdown[AlertSeverity.medium] ?? 0).toDouble(),
                  color: Colors.orange.shade400,
                ),
                PieChartEntry(
                  label: 'Low',
                  value: (summary.severityBreakdown[AlertSeverity.low] ?? 0).toDouble(),
                  color: Colors.green.shade400,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PanelCard(
          title: 'Cảnh báo theo nguồn',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: AppBarChart(
              entries: [
                for (final source in summary.bySource)
                  BarChartEntry(label: _shortSourceLabel(source.sourceName), value: source.count.toDouble()),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PanelCard(
          title: 'Xu hướng cảnh báo',
          subtitle: '7 ngày qua',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: AppLineChart(
              entries: [
                for (var i = 0; i < summary.dailyTrend.length; i++)
                  LineChartEntry(x: i.toDouble(), y: summary.dailyTrend[i].count.toDouble()),
              ],
              xLabels: [
                for (final point in summary.dailyTrend) '${point.day.day}/${point.day.month}',
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PanelCard(
          title: 'Top nguồn cảnh báo',
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: AppDataTable(
              columns: const ['Nguồn', 'Số lượng'],
              rows: [
                for (final source in summary.topSources)
                  [source.sourceName, source.count.toString()],
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Rút gọn tên nguồn cho vừa trục X của bar chart — tên đầy đủ đã có
  /// sẵn trong bảng top nguồn bên dưới.
  String _shortSourceLabel(String sourceName) {
    final dashIndex = sourceName.indexOf(' - ');
    return dashIndex == -1 ? sourceName : sourceName.substring(0, dashIndex);
  }
}

class _SeverityStatsRow extends StatelessWidget {
  const _SeverityStatsRow({required this.breakdown});

  final Map<AlertSeverity, int> breakdown;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(label: 'High', value: '${breakdown[AlertSeverity.high] ?? 0}'),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: StatCard(label: 'Medium', value: '${breakdown[AlertSeverity.medium] ?? 0}'),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: StatCard(label: 'Low', value: '${breakdown[AlertSeverity.low] ?? 0}'),
        ),
      ],
    );
  }
}
