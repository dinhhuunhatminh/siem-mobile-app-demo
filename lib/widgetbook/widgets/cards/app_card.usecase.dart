import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/cards/app_card.dart';

@widgetbook.UseCase(name: 'Default', type: AppCard)
Widget buildAppCardDefaultUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppCard(
      child: Text('Nội dung mẫu', style: Theme.of(context).textTheme.bodyLarge),
    ),
  );
}

@widgetbook.UseCase(name: 'Với nhiều dòng', type: AppCard)
Widget buildAppCardMultilineUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Tiêu đề', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Đoạn mô tả ngắn để xem card co giãn theo nội dung ra sao.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ),
  );
}
