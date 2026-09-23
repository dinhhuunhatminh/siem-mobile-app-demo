import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/panel_card.dart';
import '../../../shared/widgets/charts/app_bar_chart.dart';

@widgetbook.UseCase(name: 'Default', type: AppBarChart)
Widget buildAppBarChartUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppBarChart(
      entries: [
        BarChartEntry(label: 'T2', value: 12),
        BarChartEntry(label: 'T3', value: 18),
        BarChartEntry(label: 'T4', value: 9),
        BarChartEntry(label: 'T5', value: 24),
        BarChartEntry(label: 'T6', value: 15),
        BarChartEntry(label: 'T7', value: 6),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Trong PanelCard', type: AppBarChart)
Widget buildAppBarChartInPanelUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: PanelCard(
      title: 'Cảnh báo theo ngày',
      subtitle: '7 ngày qua',
      onMore: () {},
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: AppBarChart(
          entries: [
            BarChartEntry(label: 'T2', value: 12),
            BarChartEntry(label: 'T3', value: 18),
            BarChartEntry(label: 'T4', value: 9),
            BarChartEntry(label: 'T5', value: 24),
            BarChartEntry(label: 'T6', value: 15),
            BarChartEntry(label: 'T7', value: 6),
          ],
        ),
      ),
    ),
  );
}
