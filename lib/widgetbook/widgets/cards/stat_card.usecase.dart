import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/stat_card.dart';

@widgetbook.UseCase(name: 'Tăng', type: StatCard)
Widget buildStatCardUpUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: StatCard(
      label: 'Time Since Last Incident',
      value: '53',
      trend: StatTrend.up,
      trendValue: '3',
    ),
  );
}

@widgetbook.UseCase(name: 'Giảm', type: StatCard)
Widget buildStatCardDownUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: StatCard(
      label: 'Cảnh báo mở',
      value: '12',
      trend: StatTrend.down,
      trendValue: '5',
    ),
  );
}

@widgetbook.UseCase(name: 'Không có xu hướng', type: StatCard)
Widget buildStatCardNoneUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: StatCard(label: 'Tổng số hệ thống', value: '128'),
  );
}
