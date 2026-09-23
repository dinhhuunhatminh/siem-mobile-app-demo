import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/list_items/alert_list_item.dart';

@widgetbook.UseCase(name: 'High', type: AlertListItem)
Widget buildAlertListItemHighUseCase(BuildContext context) {
  return const AlertListItem(
    title: 'Stock price alert',
    date: '10/22/21',
    severity: AlertSeverity.high,
  );
}

@widgetbook.UseCase(name: 'Medium (có subtitle)', type: AlertListItem)
Widget buildAlertListItemMediumUseCase(BuildContext context) {
  return const AlertListItem(
    title: 'Recipe Stealing Attempt',
    subtitle: 'All Hands On Deck',
    date: '10/12/21',
    severity: AlertSeverity.medium,
  );
}

@widgetbook.UseCase(name: 'None', type: AlertListItem)
Widget buildAlertListItemNoneUseCase(BuildContext context) {
  return const AlertListItem(
    title: 'Survey responses received',
    date: '10/22/21',
  );
}
