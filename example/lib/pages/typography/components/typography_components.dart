import 'package:flutter/material.dart';
import 'package:custom_ui/custom_ui.dart';

class TypographyScaleDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TypographyScaleDemo({super.key, required this.onShowCode});
  @override
  Widget build(BuildContext context) {
    final t = CustomTypography(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const Expanded(child: Text('Scale variants', style: TextStyle(fontWeight: FontWeight.w600))),
            IconButton(
              tooltip: 'Show code',
              icon: const Icon(Icons.code),
              onPressed: () => onShowCode(_snippetScale(context)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Display Large', style: t.displayLarge),
        Text('Display Medium', style: t.displayMedium),
        Text('Display Small', style: t.displaySmall),
        Text('Headline Large', style: t.headlineLarge),
        Text('Headline Medium', style: t.headlineMedium),
        Text('Headline Small', style: t.headlineSmall),
        Text('Title Large', style: t.titleLarge),
        Text('Title Medium', style: t.titleMedium),
        Text('Title Small', style: t.titleSmall),
        Text('Body Large', style: t.bodyLarge),
        Text('Body Medium', style: t.bodyMedium),
        Text('Body Small', style: t.bodySmall),
        Text('Label Large', style: t.labelLarge),
        Text('Label Medium', style: t.labelMedium),
        Text('Label Small', style: t.labelSmall),
      ]),
    );
  }

  String _snippetScale(BuildContext context) => """
final t = CustomTypography(context);
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Display Large', style: t.displayLarge),
    Text('Headline Medium', style: t.headlineMedium),
    Text('Title Small', style: t.titleSmall),
    Text('Body Medium', style: t.bodyMedium),
    Text('Label Small', style: t.labelSmall),
  ],
)
""";
}

class TypographyWeightsDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TypographyWeightsDemo({super.key, required this.onShowCode});
  @override
  Widget build(BuildContext context) {
    final t = CustomTypography(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const Expanded(child: Text('Weights & styles', style: TextStyle(fontWeight: FontWeight.w600))),
            IconButton(
              tooltip: 'Show code',
              icon: const Icon(Icons.code),
              onPressed: () => onShowCode(_snippetWeights(context)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Normal', style: t.bodyLarge),
        Text('Bold', style: t.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
        Text('Italic', style: t.bodyLarge.copyWith(fontStyle: FontStyle.italic)),
        Text('Bold Italic', style: t.bodyLarge.copyWith(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
        Text('Underlined', style: t.bodyLarge.copyWith(decoration: TextDecoration.underline)),
        Text('Letter Spacing', style: t.bodyLarge.copyWith(letterSpacing: 1.2)),
      ]),
    );
  }

  String _snippetWeights(BuildContext context) => """
final t = CustomTypography(context);
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Normal', style: t.bodyLarge),
    Text('Bold', style: t.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
    Text('Italic', style: t.bodyLarge.copyWith(fontStyle: FontStyle.italic)),
    Text('Underline', style: t.bodyLarge.copyWith(decoration: TextDecoration.underline)),
  ],
)
""";
}

class TypographyColorsDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TypographyColorsDemo({super.key, required this.onShowCode});
  @override
  Widget build(BuildContext context) {
    final t = CustomTypography(context);
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const Expanded(child: Text('Colors (theme-based)', style: TextStyle(fontWeight: FontWeight.w600))),
            IconButton(
              tooltip: 'Show code',
              icon: const Icon(Icons.code),
              onPressed: () => onShowCode(_snippetColors(context)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Primary', style: t.titleLarge.copyWith(color: color.primary)),
        Text('Secondary', style: t.titleLarge.copyWith(color: color.secondary)),
        Text('Tertiary', style: t.titleLarge.copyWith(color: color.tertiary)),
        Text('Error', style: t.titleLarge.copyWith(color: color.error)),
        Text('On Surface', style: t.titleLarge.copyWith(color: color.onSurface)),
      ]),
    );
  }

  String _snippetColors(BuildContext context) => """
final t = CustomTypography(context);
final colors = Theme.of(context).colorScheme;
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Primary', style: t.titleLarge.copyWith(color: colors.primary)),
    Text('Secondary', style: t.titleLarge.copyWith(color: colors.secondary)),
    Text('Error', style: t.titleLarge.copyWith(color: colors.error)),
  ],
)
""";
}

class TypographyOverflowDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TypographyOverflowDemo({super.key, required this.onShowCode});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const Expanded(child: Text('Max lines & overflow', style: TextStyle(fontWeight: FontWeight.w600))),
            IconButton(
              tooltip: 'Show code',
              icon: const Icon(Icons.code),
              onPressed: () => onShowCode(_snippetOverflow(context)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CUText(
          'This is a very long line of text that will be truncated after a single line to demonstrate overflow handling with ellipsis.',
          variant: TypographyVariant.bodyLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        CUText(
          'Two line example. This block shows how text clamps to two lines gracefully across different screen sizes using the theme typography scale.',
          variant: TypographyVariant.bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }

  String _snippetOverflow(BuildContext context) => """
CUText(
  'This is a long single-line text that will be truncated',
  variant: TypographyVariant.bodyLarge,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)
""";
}


