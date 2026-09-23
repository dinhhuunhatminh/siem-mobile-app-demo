import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../features/alerts/data/models/alert_source_icon.dart';
import '../../../shared/widgets/cards/source_group_card.dart';

@widgetbook.UseCase(name: 'Default (5 log, thu gọn)', type: SourceGroupCard)
Widget buildSourceGroupCardDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SourceGroupCard(
      sourceIcon: alertSourceIcon('Firewall - Chi nhánh Hà Nội'),
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

@widgetbook.UseCase(name: '2 log (không có nút mở rộng)', type: SourceGroupCard)
Widget buildSourceGroupCardShortUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SourceGroupCard(
      sourceIcon: alertSourceIcon('SIEM - Trung tâm dữ liệu'),
      sourceName: 'SIEM - Trung tâm dữ liệu',
      entries: const [
        SourceLogEntry(title: 'Phát hiện sự kiện bất thường', time: '10:45'),
        SourceLogEntry(title: 'Đồng bộ log thành công', time: '09:00'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Với subtitle', type: SourceGroupCard)
Widget buildSourceGroupCardWithSubtitleUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SourceGroupCard(
      sourceIcon: alertSourceIcon('WAF - Cổng ứng dụng web'),
      sourceName: 'WAF - Cổng ứng dụng web',
      entries: const [
        SourceLogEntry(
          title: 'Chặn tấn công SQL Injection',
          subtitle: 'Nguồn IP: 203.0.113.42',
          time: '11:10',
        ),
        SourceLogEntry(
          title: 'Chặn tấn công XSS',
          subtitle: 'Nguồn IP: 198.51.100.7',
          time: '10:52',
        ),
        SourceLogEntry(title: 'Rule mới được áp dụng', time: '09:30'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Tất cả loại nguồn (icon theo vai trò)', type: SourceGroupCard)
Widget buildSourceGroupCardAllSourceTypesUseCase(BuildContext context) {
  const sources = [
    ('Firewall - Chi nhánh Hà Nội', 'Đã chặn 15 kết nối đáng ngờ'),
    ('SIEM - Trung tâm dữ liệu', 'Phát hiện sự kiện bất thường'),
    ('WAF - Cổng ứng dụng web', 'Chặn tấn công SQL Injection'),
    ('NAC - Kiểm soát truy cập mạng', 'Thiết bị lạ kết nối vào mạng nội bộ'),
    ('Antivirus - Máy trạm', 'Phát hiện mã độc trên máy trạm'),
  ];

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        for (final (sourceName, title) in sources)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SourceGroupCard(
              sourceIcon: alertSourceIcon(sourceName),
              sourceName: sourceName,
              entries: [SourceLogEntry(title: title, time: '11:22')],
            ),
          ),
      ],
    ),
  );
}
