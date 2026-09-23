import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// 1 điểm dữ liệu trên đường — dữ liệu thuần, AppLineChart tự vẽ thành
/// LineChart. x thường là chỉ số thời gian (giờ trong ngày...), không
/// phải nhãn text (khác BarChartEntry) vì đường cần trục liên tục.
class LineChartEntry {
  const LineChartEntry({required this.x, required this.y});

  final double x;
  final double y;
}

/// Biểu đồ đường xu hướng chuẩn — dùng cho log/cảnh báo theo thời gian
/// (vd số lượng log mỗi giờ trong ngày). Tô màu theo colorScheme.primary,
/// có vùng gradient mờ phía dưới đường để dễ đọc xu hướng tăng/giảm.
///
/// xLabels (tùy chọn) là nhãn hiển thị dưới trục hoành, cùng thứ tự với
/// entries theo x — nếu không truyền, trục hoành ẩn nhãn (chỉ còn lưới +
/// trục tung), giữ hành vi tương thích cho nơi chưa cần nhãn ngày/giờ.
class AppLineChart extends StatelessWidget {
  const AppLineChart({super.key, required this.entries, this.xLabels, this.height = 200});

  final List<LineChartEntry> entries;
  final List<String>? xLabels;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final maxY = entries.map((e) => e.y).fold<double>(0, (a, b) => a > b ? a : b);
    final chartMaxY = maxY == 0 ? 1.0 : maxY * 1.2;

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          maxY: chartMaxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: chartMaxY / 4,
            getDrawingHorizontalLine: (_) => FlLine(color: colorScheme.outlineVariant, strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: chartMaxY / 4,
                getTitlesWidget: (value, meta) {
                  if (value == meta.max) return const SizedBox.shrink();
                  return Text(value.toInt().toString(), style: Theme.of(context).textTheme.labelSmall);
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: xLabels != null,
                getTitlesWidget: (value, meta) {
                  final labels = xLabels;
                  if (labels == null) return const SizedBox.shrink();
                  final index = value.toInt();
                  if (index < 0 || index >= labels.length) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(labels[index], style: Theme.of(context).textTheme.labelSmall),
                  );
                },
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => colorScheme.inverseSurface,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [for (final e in entries) FlSpot(e.x, e.y)],
              isCurved: true,
              color: colorScheme.primary,
              barWidth: 3,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: colorScheme.primary.withValues(alpha: 0.15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
