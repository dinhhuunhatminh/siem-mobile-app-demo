/// Mức độ nghiêm trọng — cố định 3 cấp theo phạm vi đã chốt, không mở
/// rộng thêm Critical/Info để giữ đúng scope Splunk Mobile đơn giản.
enum AlertSeverity { high, medium, low }

/// 1 alert = 1 sự kiện/log từ 1 nguồn cụ thể (không phải 1 "rule" bị vi
/// phạm) — đúng quyết định đã chốt. sourceName là chuỗi động lấy thẳng
/// từ backend, không map qua enum nguồn cố định.
class Alert {
  const Alert({
    required this.id,
    required this.title,
    required this.severity,
    required this.sourceName,
    required this.timestamp,
    this.description,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      severity: AlertSeverity.values.byName(json['severity'] as String),
      sourceName: json['sourceName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final String id;
  final String title;
  final String? description;
  final AlertSeverity severity;
  final String sourceName;
  final DateTime timestamp;
}
