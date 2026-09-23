import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_spacing.dart';
import '../../../../shared/widgets/cards/source_group_card.dart' show SourceLogEntry;
import '../../../../shared/widgets/chips/app_chip.dart';
import '../../../../shared/widgets/list_items/stacked_card_group.dart';
import '../../../../shared/widgets/scaffolds/app_scaffold.dart';
import '../../../../shared/widgets/search_dialog/search_dialog.dart';
import '../../../../shared/widgets/states/empty_state_view.dart';
import '../../../../shared/widgets/states/error_state_view.dart';
import '../../../../shared/widgets/states/loading_indicator.dart';
import '../../data/models/alert.dart';
import '../../data/models/alert_source_icon.dart';
import '../state/alerts_controller.dart';
import 'alert_detail_screen.dart';

/// Không dùng AppListScaffold ở đây vì màn này cần 1 thanh filter chip
/// cố định phía trên danh sách — AppListScaffold chỉ có chỗ cho đúng 1
/// nội dung chính (Loading/Error/Empty/List), không có vùng phụ cố định.
class AlertsScreen extends ConsumerWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSelectedSeverities = ref.watch(alertsControllerProvider);
    final controller = ref.read(alertsControllerProvider.notifier);

    return AppScaffold(
      title: 'Alerts',
      padHorizontal: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _openSearch(context, controller),
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            child: _SeverityFilterRow(
              selected: asyncSelectedSeverities.value ?? {},
              onToggle: controller.toggleSeverity,
            ),
          ),
          Expanded(
            child: switch (asyncSelectedSeverities) {
              AsyncLoading() => const LoadingIndicator(),
              AsyncError(:final error) => ErrorStateView(
                  message: 'Không tải được danh sách: $error',
                  onRetry: () => ref.invalidate(alertsControllerProvider),
                ),
              AsyncData() => _AlertGroupList(groups: controller.filteredGroups),
            },
          ),
        ],
      ),
    );
  }

  Future<void> _openSearch(BuildContext context, AlertsController controller) async {
    final alerts = controller.filteredAlerts;
    // Hiện cả tên nguồn trong item hiển thị để SearchDialog lọc được theo
    // cả title lẫn sourceName (SearchDialog chỉ nhận List<String>, không
    // có key riêng để tìm theo nhiều trường).
    final displayItems = [for (final a in alerts) '${a.title} — ${a.sourceName}'];

    final selected = await SearchDialog.show(context, title: 'Tìm cảnh báo', items: displayItems);
    if (selected == null || !context.mounted) return;

    final index = displayItems.indexOf(selected);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AlertDetailScreen(alert: alerts[index])),
    );
  }
}

class _SeverityFilterRow extends StatelessWidget {
  const _SeverityFilterRow({required this.selected, required this.onToggle});

  final Set<AlertSeverity> selected;
  final ValueChanged<AlertSeverity> onToggle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      children: [
        for (final severity in AlertSeverity.values)
          AppChip(
            label: _severityLabel(severity),
            selected: selected.contains(severity),
            onSelected: (_) => onToggle(severity),
          ),
      ],
    );
  }

  String _severityLabel(AlertSeverity severity) => switch (severity) {
        AlertSeverity.high => 'High',
        AlertSeverity.medium => 'Medium',
        AlertSeverity.low => 'Low',
      };
}

class _AlertGroupList extends StatelessWidget {
  const _AlertGroupList({required this.groups});

  final List<AlertSourceGroup> groups;

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return const EmptyStateView(message: 'Không có cảnh báo nào khớp bộ lọc');
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: StackedCardGroup(
            sourceIcon: alertSourceIcon(group.sourceName),
            sourceName: group.sourceName,
            entries: [
              for (final alert in group.alerts)
                SourceLogEntry(
                  title: alert.title,
                  subtitle: alert.description,
                  time: _formatTime(alert.timestamp),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AlertDetailScreen(alert: alert)),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

String _formatTime(DateTime dt) {
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(dt.hour)}:${two(dt.minute)}';
}
