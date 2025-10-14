import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Info Snackbar Demo
class InfoSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const InfoSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.showInfo(
  context: context,
  message: "New features are available!",
  actionLabel: "Learn More",
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.showInfo(
            context: context,
            message: "New features are available!",
            actionLabel: "Learn More",
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text("Info", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}