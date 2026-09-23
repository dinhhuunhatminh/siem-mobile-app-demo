import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/list_items/alert_list_item.dart';
import '../../../shared/widgets/scaffolds/app_list_scaffold.dart';

@widgetbook.UseCase(name: 'Loading', type: AppListScaffold)
Widget buildAppListScaffoldLoadingUseCase(BuildContext context) {
  return AppListScaffold<String>(
    title: 'Alerts',
    state: const ListLoading(),
    itemBuilder: (context, item) => Text(item),
  );
}

@widgetbook.UseCase(name: 'Error', type: AppListScaffold)
Widget buildAppListScaffoldErrorUseCase(BuildContext context) {
  return AppListScaffold<String>(
    title: 'Alerts',
    state: ListError('Không tải được danh sách', onRetry: () {}),
    itemBuilder: (context, item) => Text(item),
  );
}

@widgetbook.UseCase(name: 'Empty', type: AppListScaffold)
Widget buildAppListScaffoldEmptyUseCase(BuildContext context) {
  return AppListScaffold<String>(
    title: 'Alerts',
    state: const ListEmpty('Chưa có cảnh báo nào'),
    itemBuilder: (context, item) => Text(item),
  );
}

@widgetbook.UseCase(name: 'Data', type: AppListScaffold)
Widget buildAppListScaffoldDataUseCase(BuildContext context) {
  return AppListScaffold<(String, AlertSeverity)>(
    title: 'Alerts',
    state: const ListData([
      ('Stock price alert', AlertSeverity.high),
      ('Order volume alert', AlertSeverity.medium),
      ('Survey responses received', AlertSeverity.none),
    ]),
    itemBuilder: (context, item) => AlertListItem(
      title: item.$1,
      date: '10/22/21',
      severity: item.$2,
    ),
  );
}
