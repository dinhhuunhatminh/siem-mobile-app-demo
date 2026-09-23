import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/panel_card.dart';
import '../../../shared/widgets/charts/app_pie_chart.dart';

@widgetbook.UseCase(name: 'Default', type: AppPieChart)
Widget buildAppPieChartUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AppPieChart(
      entries: [
        PieChartEntry(label: 'High', value: 6, color: Color(0xFFE2685F)),
        PieChartEntry(label: 'Medium', value: 5, color: Color(0xFFE6B455)),
        PieChartEntry(label: 'Low', value: 5, color: Color(0xFF7EE2B8)),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Trong PanelCard', type: AppPieChart)
Widget buildAppPieChartInPanelUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: PanelCard(
      title: 'Tỷ lệ theo mức độ',
      subtitle: 'Tổng quan hiện tại',
      onMore: () {},
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: AppPieChart(
          entries: [
            PieChartEntry(label: 'High', value: 6, color: Color(0xFFE2685F)),
            PieChartEntry(label: 'Medium', value: 5, color: Color(0xFFE6B455)),
            PieChartEntry(label: 'Low', value: 5, color: Color(0xFF7EE2B8)),
          ],
        ),
      ),
    ),
  );
}
