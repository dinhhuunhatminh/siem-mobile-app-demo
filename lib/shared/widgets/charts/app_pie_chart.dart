import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// 1 lát cắt dữ liệu — dữ liệu thuần, AppPieChart tự vẽ thành PieChart.
/// Nhận màu trực tiếp (khác AppBarChart/AppLineChart chỉ dùng 1 màu
/// colorScheme.primary) vì mục đích chính là phân biệt tỷ lệ giữa các
/// lát — cần nhiều màu khác nhau trong cùng 1 biểu đồ.
class PieChartEntry {
  const PieChartEntry({required this.label, required this.value, required this.color});

  final String label;
  final double value;
  final Color color;
}

/// Biểu đồ tròn chuẩn — nhận danh sách (label, value, color) tùy ý, có
/// chú thích (legend) kèm theo bên dưới vì bản thân lát cắt không tự
/// hiện được nhãn dài.
class AppPieChart extends StatelessWidget {
  const AppPieChart({super.key, required this.entries, this.size = 160});

  final List<PieChartEntry> entries;
  final double size;

  @override
  Widget build(BuildContext context) {
    final total = entries.fold<double>(0, (sum, e) => sum + e.value);

    return Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: size / 4,
              sections: [
                for (final entry in entries)
                  PieChartSectionData(
                    value: entry.value,
                    color: entry.color,
                    title: total == 0 ? '' : '${(entry.value / total * 100).round()}%',
                    radius: size / 4,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 4,
          alignment: WrapAlignment.center,
          children: [
            for (final entry in entries)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(color: entry.color, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Text('${entry.label} (${entry.value.toInt()})',
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
