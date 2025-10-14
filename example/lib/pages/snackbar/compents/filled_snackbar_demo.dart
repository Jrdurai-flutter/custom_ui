import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Filled Style Snackbar Demo
class FilledSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FilledSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Filled style snackbar",
  style: SnackbarStyle.filled,
  backgroundColor: Colors.indigo,
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Filled style snackbar",
            style: SnackbarStyle.filled,
            backgroundColor: Colors.indigo,
          );
        },
        child: const Text("Filled"),
      ),
    );
  }
}