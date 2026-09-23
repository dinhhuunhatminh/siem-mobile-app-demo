import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main_widgetbook.directories.g.dart';

/// Entrypoint riêng cho Widgetbook — catalog xem thử từng component/state
/// độc lập, KHÔNG dính tới AuthState/GoRouter/backend thật của app chính.
///
/// Chạy bằng: flutter run -t lib/main_widgetbook.dart -d chrome
/// Mỗi khi thêm 1 use case (@widgetbook.UseCase) mới, chạy lại:
///   dart run build_runner build
/// để main_widgetbook.directories.g.dart tự cập nhật danh sách.
void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue)),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue, brightness: Brightness.dark),
            ),
          ],
        ),
        ViewportAddon(Viewports.all),
      ],
    );
  }
}
