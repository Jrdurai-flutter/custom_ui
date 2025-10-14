
import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Success Snackbar Demo
class SuccessSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const SuccessSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.showSuccess(
  context: context,
  message: "File uploaded successfully!",
);
""",
      onShowCode: onShowCode,
      child: ElevatedButton(
        onPressed: () {
          CustomSnackbar.showSuccess(
            context: context,
            message: "File uploaded successfully!",
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Success", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}