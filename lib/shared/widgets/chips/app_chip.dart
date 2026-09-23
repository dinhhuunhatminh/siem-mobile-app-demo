import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';

/// Chip lọc bo tròn hoàn toàn (pill shape) — bọc FilterChip có sẵn của
/// Material, chỉ chuẩn hóa shape theo AppRadius thay vì mỗi nơi tự set
/// borderRadius riêng.
class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
    );
  }
}
