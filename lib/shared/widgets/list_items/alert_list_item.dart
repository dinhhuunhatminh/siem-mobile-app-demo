import 'package:flutter/material.dart';

/// Mức độ nghiêm trọng — enum thay vì nhận Color tùy ý, để mọi nơi dùng
/// AlertListItem tự động có cùng 1 bảng màu cho cùng 1 mức độ (tránh mỗi
/// feature tự chọn màu vàng/cam khác nhau cho cùng ý nghĩa "medium").
enum AlertSeverity { none, low, medium, high }

extension on AlertSeverity {
  Color color(ColorScheme colorScheme) {
    switch (this) {
      case AlertSeverity.none:
        return colorScheme.outline;
      case AlertSeverity.low:
        return const Color(0xFFEAB308); // vàng
      case AlertSeverity.medium:
        return const Color(0xFFF97316); // cam
      case AlertSeverity.high:
        return colorScheme.error; // đỏ
    }
  }
}

/// Item danh sách chuẩn cho alert/thông báo — chấm màu mức độ + tiêu đề +
/// phụ đề (optional) + ngày.
class AlertListItem extends StatelessWidget {
  const AlertListItem({
    super.key,
    required this.title,
    required this.date,
    this.subtitle,
    this.severity = AlertSeverity.none,
    this.onTap,
  });

  final String title;
  final String date;
  final String? subtitle;
  final AlertSeverity severity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: CircleAvatar(radius: 6, backgroundColor: severity.color(colorScheme)),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Text(date, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
