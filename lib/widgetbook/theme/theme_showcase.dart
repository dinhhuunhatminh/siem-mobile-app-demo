import 'package:flutter/material.dart';

import '../../shared/widgets/cards/app_card.dart';

/// Chỉ dùng để xem AppTheme trong Widgetbook — không phải component
/// sản xuất, không import ở bất kỳ đâu trong lib/features hay lib/app.
class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ColorSwatch('primary', colorScheme.primary),
                _ColorSwatch('secondary', colorScheme.secondary),
                _ColorSwatch('surface', colorScheme.surface),
                _ColorSwatch('error', colorScheme.error),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const SizedBox(height: 24),
            AppCard(
              child: Text('Card mẫu', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
