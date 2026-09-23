import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../../shared/widgets/chips/app_chip.dart';

@widgetbook.UseCase(name: 'Default', type: AppChip)
Widget buildAppChipUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: StatefulBuilder(
      builder: (context, setState) {
        var selected = false;
        return AppChip(
          label: 'High',
          selected: selected,
          onSelected: (value) => setState(() => selected = value),
        );
      },
    ),
  );
}

@widgetbook.UseCase(name: 'Nhóm nhiều chip', type: AppChip)
Widget buildAppChipGroupUseCase(BuildContext context) {
  return _ChipGroupDemo();
}

class _ChipGroupDemo extends StatefulWidget {
  @override
  State<_ChipGroupDemo> createState() => _ChipGroupDemoState();
}

class _ChipGroupDemoState extends State<_ChipGroupDemo> {
  final Set<String> _selected = {'High'};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        children: ['High', 'Medium', 'Low']
            .map(
              (label) => AppChip(
                label: label,
                selected: _selected.contains(label),
                onSelected: (value) => setState(() {
                  value ? _selected.add(label) : _selected.remove(label);
                }),
              ),
            )
            .toList(),
      ),
    );
  }
}
