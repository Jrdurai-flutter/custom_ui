
import 'package:custom_ui/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Error Snackbar Demo
class ErrorSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ErrorSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.showError(
  context: context,
  message: "Failed to upload file!",
  actionLabel: "Retry",
  onActionPressed: () {
    print("Retry action pressed");
  },
);
""",
      onShowCode: onShowCode,
      child: ElevatedButton(
        onPressed: () {
          CustomSnackbar.showError(
            context: context,
            message: "Failed to upload file!",
            actionLabel: "Retry",
            onActionPressed: () {
              print("Retry action pressed");
            },
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Error", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}