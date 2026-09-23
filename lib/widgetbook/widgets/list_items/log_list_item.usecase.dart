import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/list_items/log_list_item.dart';

@widgetbook.UseCase(name: 'Default', type: LogListItem)
Widget buildLogListItemUseCase(BuildContext context) {
  return const LogListItem(
    sourceIcon: Icons.security,
    title: 'Đã chặn 15 kết nối đáng ngờ',
    time: '11:22',
  );
}

@widgetbook.UseCase(name: 'Có subtitle', type: LogListItem)
Widget buildLogListItemWithSubtitleUseCase(BuildContext context) {
  return const LogListItem(
    sourceIcon: Icons.dns_outlined,
    title: 'SIEM - Trung tâm dữ liệu',
    subtitle: 'Phát hiện 3 sự kiện bất thường trong 1 giờ qua',
    time: '10:45',
  );
}
