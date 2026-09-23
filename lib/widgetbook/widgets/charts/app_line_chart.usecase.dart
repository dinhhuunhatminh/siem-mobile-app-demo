import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/panel_card.dart';
import '../../../shared/widgets/charts/app_line_chart.dart';

const _sampleEntries = [
  LineChartEntry(x: 0, y: 3),
  LineChartEntry(x: 1, y: 5),
  LineChartEntry(x: 2, y: 4),
  LineChartEntry(x: 3, y: 8),
  LineChartEntry(x: 4, y: 12),
  LineChartEntry(x: 5, y: 7),
  LineChartEntry(x: 6, y: 15),
];

const _sampleXLabels = ['17/9', '18/9', '19/9', '20/9', '21/9', '22/9', '23/9'];

@widgetbook.UseCase(name: 'Default', type: AppLineChart)
Widget buildAppLineChartUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppLineChart(entries: _sampleEntries, xLabels: _sampleXLabels),
  );
}

@widgetbook.UseCase(name: 'Trong PanelCard', type: AppLineChart)
Widget buildAppLineChartInPanelUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: PanelCard(
      title: 'Xu hướng cảnh báo',
      subtitle: '7 ngày qua',
      onExpand: () {},
      onMore: () {},
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: AppLineChart(entries: _sampleEntries, xLabels: _sampleXLabels),
      ),
    ),
  );
}
