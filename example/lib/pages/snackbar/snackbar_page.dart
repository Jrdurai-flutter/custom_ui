import 'package:flutter/material.dart';
import '../../widgets/widget_compents.dart';
import 'compents/snackbar.dart';

class SnackbarPage extends StatelessWidget {
  final void Function(String) onShowCode;

  const SnackbarPage({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      children: [
        const Text(
          'Basic Snackbar Types (2-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 3.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SuccessSnackbarDemo(onShowCode: onShowCode),
            ErrorSnackbarDemo(onShowCode: onShowCode),
            WarningSnackbarDemo(onShowCode: onShowCode),
            InfoSnackbarDemo(onShowCode: onShowCode),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Snackbar Styles (2-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            FilledSnackbarDemo(onShowCode: onShowCode),
            OutlinedSnackbarDemo(onShowCode: onShowCode),
            FloatingSnackbarDemo(onShowCode: onShowCode),
            MinimalSnackbarDemo(onShowCode: onShowCode),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Snackbar with Actions (2-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            TextActionSnackbarDemo(onShowCode: onShowCode),
            ElevatedActionSnackbarDemo(onShowCode: onShowCode),
            OutlinedActionSnackbarDemo(onShowCode: onShowCode),
            CloseIconSnackbarDemo(onShowCode: onShowCode),
          ],
        ),
      ],
    );
  }
}




















