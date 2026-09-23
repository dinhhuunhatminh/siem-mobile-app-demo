import 'package:flutter/material.dart';

/// Hiện khi 1 danh sách không có dữ liệu (khác với ErrorStateView — đây
/// là trạng thái hợp lệ, không phải lỗi). Không có Scaffold/AppBar vì là
/// widget con đặt trong body của màn hình khác.
class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
