import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Outlined Style Snackbar Demo
class OutlinedSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Outlined style snackbar",
  style: SnackbarStyle.outlined,
  backgroundColor: Colors.white,
  textColor: Colors.black,
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Outlined style snackbar",
            style: SnackbarStyle.outlined,
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.grey),
        ),
        child: const Text("Outlined"),
      ),
    );
  }
}