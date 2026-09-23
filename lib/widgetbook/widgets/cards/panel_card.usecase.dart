import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/panel_card.dart';
import '../../../shared/widgets/tables/app_data_table.dart';

@widgetbook.UseCase(name: 'Với bảng', type: PanelCard)
Widget buildPanelCardWithTableUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: PanelCard(
      title: 'Most Recent Major Incidents',
      subtitle: '08:18:04',
      onExpand: () {},
      onMore: () {},
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: AppDataTable(
          columns: ['EVENT', 'TIME'],
          rows: [
            ['Recipe Stealing Attempt', 'Aug 10, 9:45 AM'],
            ['Freezer Breakdown', 'Aug 9, 5:35 PM'],
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Chỉ title, không action', type: PanelCard)
Widget buildPanelCardMinimalUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: PanelCard(
      title: 'Tổng quan',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Text('Nội dung bất kỳ', style: Theme.of(context).textTheme.bodyMedium),
      ),
    ),
  );
}
