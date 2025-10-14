
import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Warning Snackbar Demo
class WarningSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const WarningSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.showWarning(
  context: context,
  message: "Storage space is running low!",
);
""",
      onShowCode: onShowCode,
      child: ElevatedButton(
        onPressed: () {
          CustomSnackbar.showWarning(
            context: context,
            message: "Storage space is running low!",
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        child: const Text("Warning", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}