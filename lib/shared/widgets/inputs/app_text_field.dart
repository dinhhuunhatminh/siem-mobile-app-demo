import 'package:flutter/material.dart';

/// Ô nhập liệu chuẩn — bọc TextField, tự hiện errorText qua InputDecoration
/// (Flutter tự vẽ khung đỏ + dòng lỗi bên dưới) thay vì mỗi màn hình tự
/// viết Text lỗi riêng bên ngoài field.
///
/// Khi obscureText = true, tự thêm nút con mắt để người dùng bật/tắt ẩn
/// mật khẩu — cần StatefulWidget vì trạng thái "đang ẩn hay hiện" là của
/// riêng ô input này, không phải thứ nơi gọi (LoginScreen) cần quan tâm.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
    this.enabled = true,
  });

  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isObscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText && _isObscured,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: widget.errorText,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(_isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                onPressed: widget.enabled
                    ? () => setState(() => _isObscured = !_isObscured)
                    : null,
              )
            : null,
      ),
    );
  }
}
