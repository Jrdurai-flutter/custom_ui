import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';
/// Close Icon Snackbar Demo
class CloseIconSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const CloseIconSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "This snackbar has a close icon",
  showCloseIcon: true,
  backgroundColor: Colors.deepOrange,
  duration: Duration(seconds: 10),
);
""",
      onShowCode: onShowCode,
      child: ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "This snackbar has a close icon",
            showCloseIcon: true,
            backgroundColor: Colors.deepOrange,
            duration: const Duration(seconds: 10),
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
        child: const Text("With Close Icon", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
