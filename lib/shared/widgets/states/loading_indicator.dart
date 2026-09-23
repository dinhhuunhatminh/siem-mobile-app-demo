import 'package:flutter/material.dart';

/// Vòng xoay loading dùng chung — kích thước cố định, tự căn giữa. Dùng
/// cho toàn màn hình (đang tải danh sách...), khác với vòng xoay nhỏ bên
/// trong AppButton (đó là loading của riêng 1 nút, không phải cả màn).
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
