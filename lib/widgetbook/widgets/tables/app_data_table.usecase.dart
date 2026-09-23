import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/tables/app_data_table.dart';

@widgetbook.UseCase(name: 'Default', type: AppDataTable)
Widget buildAppDataTableDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppDataTable(
      columns: const ['EVENT', 'TIME'],
      rows: const [
        ['Recipe Stealing Attempt', 'Aug 10, 9:45 AM'],
        ['Freezer Breakdown', 'Aug 9, 5:35 PM'],
        ['Out of Ketchup!', 'Aug 9, 11:25 AM'],
        ['Spoiled Meat', 'Aug 8, 12:21 PM'],
        ['Zoo Escape', 'Aug 8, 8:18 AM'],
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Nhiều cột', type: AppDataTable)
Widget buildAppDataTableMultiColumnUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppDataTable(
      columns: const ['HỆ THỐNG', 'TRẠNG THÁI', 'CẬP NHẬT'],
      rows: const [
        ['Firewall - Hà Nội', 'Online', '10:22'],
        ['SIEM - TT dữ liệu', 'Cảnh báo', '10:18'],
        ['WAF - Cổng web', 'Offline', '09:55'],
      ],
    ),
  );
}
