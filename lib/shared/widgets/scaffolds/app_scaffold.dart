import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';

/// Khung cơ bản dùng chung — AppBar + padding ngang cố định, để mọi màn
/// hình "cảm giác" nhất quán thay vì mỗi feature tự set padding khác
/// nhau. AppListScaffold/AppFormScaffold dựng trên nền khung này.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.padHorizontal = true,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final bool padHorizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: padHorizontal
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: body,
            )
          : body,
    );
  }
}
