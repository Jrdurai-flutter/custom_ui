import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Text Action Snackbar Demo
class TextActionSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TextActionSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Message sent successfully",
  actionLabel: "Undo",
  actionStyle: ActionStyle.text,
  onActionPressed: () {
    print("Undo action pressed");
  },
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Message sent successfully",
            actionLabel: "Undo",
            actionStyle: ActionStyle.text,
            onActionPressed: () {
              print("Undo action pressed");
            },
          );
        },
        child: const Text("Text Action"),
      ),
    );
  }
}