import 'package:flutter/material.dart';

/// Màn hình placeholder dùng chung cho các tab chưa code xong (Alerts,
/// Dashboards, Reports). Không đặt trong features/ vì nó không thuộc
/// riêng feature nào — chỉ 1 widget chung, nhận title để tái sử dụng.
class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              '$title đang trong quá trình phát triển',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
