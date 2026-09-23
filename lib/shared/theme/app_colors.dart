import 'package:flutter/material.dart';

/// Màu gốc dùng để sinh ColorScheme qua Material 3 (colorSchemeSeed).
/// Không dùng trực tiếp màu này để tô UI — luôn đi qua
/// Theme.of(context).colorScheme để tự đổi đúng theo light/dark.
class AppColors {
  AppColors._();

  static const seed = Color(0xFF2563EB); // xanh trung tính, khớp report.html
}
