import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/source_group_card.dart' show SourceLogEntry;
import '../../../shared/widgets/list_items/stacked_card_group.dart';

/// Bấm vào nhóm thẻ để xem animation xếp chồng <-> giãn ra.
@widgetbook.UseCase(name: 'Default (bấm để mở/thu gọn)', type: StackedCardGroup)
Widget buildStackedCardGroupUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: StackedCardGroup(
      sourceIcon: Icons.security,
      sourceName: 'Firewall - Chi nhánh Hà Nội',
      entries: const [
        SourceLogEntry(title: 'Đã chặn 15 kết nối đáng ngờ', time: '11:22'),
        SourceLogEntry(title: 'Cập nhật luật tường lửa', time: '10:03'),
        SourceLogEntry(title: 'Phát hiện quét cổng', time: '09:41'),
        SourceLogEntry(title: 'Đăng nhập quản trị thành công', time: '08:15'),
        SourceLogEntry(title: 'Khởi động lại dịch vụ', time: '07:00'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Ít hơn collapsedVisibleCount', type: StackedCardGroup)
Widget buildStackedCardGroupFewUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: StackedCardGroup(
      sourceIcon: Icons.dns_outlined,
      sourceName: 'SIEM - Trung tâm dữ liệu',
      entries: const [
        SourceLogEntry(title: 'Phát hiện sự kiện bất thường', time: '10:45'),
        SourceLogEntry(title: 'Đồng bộ log thành công', time: '09:00'),
      ],
    ),
  );
}
