import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/states/rich_empty_state.dart';

@widgetbook.UseCase(name: 'Default', type: RichEmptyState)
Widget buildRichEmptyStateUseCase(BuildContext context) {
  return RichEmptyState(
    illustration: Icon(
      Icons.dashboard_customize_outlined,
      size: 96,
      color: Theme.of(context).colorScheme.primary,
    ),
    title: 'Add Panels to Home',
    steps: const [
      'Select a dashboard',
      'Choose a panel to save',
      'Tap the more options menu (...)',
      'Select Add to Home',
    ],
    ctaLabel: 'Go to Dashboards',
    onCtaPressed: () {},
  );
}
