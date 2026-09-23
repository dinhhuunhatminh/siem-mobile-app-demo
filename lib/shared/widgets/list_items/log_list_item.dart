import 'package:flutter/material.dart';

import '../cards/app_card.dart';

/// Item log đơn — có icon nguồn (khác AlertListItem dùng chấm màu mức độ).
/// Tự nổi trên nền xung quanh (dùng AppCard làm khung, bo góc + màu nền
/// khác biệt), giống từng khối thông báo riêng trong Trung tâm thông báo
/// iOS — không phải dòng kẻ liền mạch trong 1 danh sách phẳng.
///
/// Đây là component riêng biệt, không sửa AlertListItem đã có — hai
/// component phục vụ 2 ngữ cảnh khác nhau (mức độ nghiêm trọng vs nguồn
/// phát sinh), không thay thế cho nhau.
class LogListItem extends StatelessWidget {
  const LogListItem({
    super.key,
    required this.sourceIcon,
    required this.title,
    required this.time,
    this.subtitle,
    this.onTap,
  });

  final IconData sourceIcon;
  final String title;
  final String time;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: colorScheme.secondaryContainer,
              child: Icon(sourceIcon, size: 20, color: colorScheme.onSecondaryContainer),
            ),
            title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            trailing: Text(time, style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ),
    );
  }
}
