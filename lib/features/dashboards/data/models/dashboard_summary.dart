import '../../../alerts/data/models/alert.dart';

/// 1 điểm trong biểu đồ xu hướng theo ngày.
class DailyAlertCount {
  const DailyAlertCount({required this.day, required this.count});

  factory DailyAlertCount.fromJson(Map<String, dynamic> json) {
    return DailyAlertCount(
      day: DateTime.parse(json['day'] as String),
      count: json['count'] as int,
    );
  }

  final DateTime day;
  final int count;
}

/// 1 dòng thống kê theo nguồn — dùng chung cho cả bar chart (bySource)
/// và bảng top nguồn (topSources).
class SourceAlertCount {
  const SourceAlertCount({required this.sourceName, required this.count});

  factory SourceAlertCount.fromJson(Map<String, dynamic> json) {
    return SourceAlertCount(
      sourceName: json['sourceName'] as String,
      count: json['count'] as int,
    );
  }

  final String sourceName;
  final int count;
}

/// Toàn bộ dữ liệu cho 4 panel của Dashboards — backend đã tính sẵn
/// (GROUP BY/COUNT), app chỉ hiển thị, không tự tính lại.
class DashboardSummary {
  const DashboardSummary({
    required this.severityBreakdown,
    required this.bySource,
    required this.dailyTrend,
    required this.topSources,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    final severityJson = json['severityBreakdown'] as Map<String, dynamic>;

    return DashboardSummary(
      severityBreakdown: {
        for (final severity in AlertSeverity.values)
          severity: severityJson[severity.name] as int? ?? 0,
      },
      bySource: [
        for (final item in json['bySource'] as List<dynamic>)
          SourceAlertCount.fromJson(item as Map<String, dynamic>),
      ],
      dailyTrend: [
        for (final item in json['dailyTrend'] as List<dynamic>)
          DailyAlertCount.fromJson(item as Map<String, dynamic>),
      ],
      topSources: [
        for (final item in json['topSources'] as List<dynamic>)
          SourceAlertCount.fromJson(item as Map<String, dynamic>),
      ],
    );
  }

  final Map<AlertSeverity, int> severityBreakdown;
  final List<SourceAlertCount> bySource;
  final List<DailyAlertCount> dailyTrend;
  final List<SourceAlertCount> topSources;
}
