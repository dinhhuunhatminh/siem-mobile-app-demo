import 'package:flutter/material.dart';

/// Suy ra icon theo LOẠI nguồn (phần trước dấu " - " trong sourceName, vd
/// "Firewall - Chi nhánh Hà Nội" → "Firewall"), không map theo toàn bộ
/// sourceName vì tên chi nhánh/cụm từ phía sau có thể đổi mà loại nguồn
/// vẫn giữ nguyên. Không khớp loại nào đã biết → fallback icon chung.
IconData alertSourceIcon(String sourceName) {
  final type = sourceName.split(' - ').first.trim().toLowerCase();

  return switch (type) {
    'firewall' => Icons.security,
    'siem' => Icons.hub_outlined,
    'waf' => Icons.language,
    'nac' => Icons.badge_outlined,
    'antivirus' => Icons.coronavirus_outlined,
    _ => Icons.dns_outlined,
  };
}
