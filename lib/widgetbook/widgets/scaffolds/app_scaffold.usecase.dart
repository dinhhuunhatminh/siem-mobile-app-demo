import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/scaffolds/app_scaffold.dart';

@widgetbook.UseCase(name: 'Default', type: AppScaffold)
Widget buildAppScaffoldUseCase(BuildContext context) {
  return AppScaffold(
    title: 'Tiêu đề màn hình',
    actions: [IconButton(icon: const Icon(Icons.settings), onPressed: () {})],
    body: Text('Nội dung bất kỳ', style: Theme.of(context).textTheme.bodyLarge),
  );
}
