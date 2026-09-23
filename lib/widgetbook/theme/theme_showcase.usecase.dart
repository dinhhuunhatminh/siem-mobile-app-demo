import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'theme_showcase.dart';

@widgetbook.UseCase(name: 'Default', type: ThemeShowcase)
Widget buildThemeShowcaseUseCase(BuildContext context) {
  return const ThemeShowcase();
}
