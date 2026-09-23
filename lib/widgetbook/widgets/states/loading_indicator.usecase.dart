import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/states/loading_indicator.dart';

@widgetbook.UseCase(name: 'Default', type: LoadingIndicator)
Widget buildLoadingIndicatorUseCase(BuildContext context) {
  return const SizedBox(height: 200, child: LoadingIndicator());
}
