import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';

/// Thẻ dùng chung — chỉ bọc Card + padding chuẩn, không tự định nghĩa
/// shape/elevation vì AppTheme.cardTheme đã lo phần đó (bo góc, border,
/// elevation 0). Nhận child tùy ý, không giả định cấu trúc nội dung.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: padding, child: child),
    );
  }
}
