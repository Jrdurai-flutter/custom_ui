import 'package:flutter/material.dart';
import 'package:custom_ui/custom_toaster.dart';
import '../../widgets/widget_compents.dart';

class ToasterPage extends StatelessWidget {
  final void Function(String) onShowCode;

  const ToasterPage({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      children: [
        const Text(
          'Basic Toaster Types (2-column grid)',
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
            SuccessToasterDemo(onShowCode: onShowCode),
            ErrorToasterDemo(onShowCode: onShowCode),
            WarningToasterDemo(onShowCode: onShowCode),
            InfoToasterDemo(onShowCode: onShowCode),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Toaster Positions (3-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            TopToasterDemo(onShowCode: onShowCode),
            CenterToasterDemo(onShowCode: onShowCode),
            BottomToasterDemo(onShowCode: onShowCode),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Advanced Toaster Features (2-column grid)',
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
            CustomToasterDemo(onShowCode: onShowCode),
            TitleToasterDemo(onShowCode: onShowCode),
            LongDurationToasterDemo(onShowCode: onShowCode),
            NonDismissibleToasterDemo(onShowCode: onShowCode),
          ],
        ),
      ],
    );
  }
}

/// Success Toaster Demo
class SuccessToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const SuccessToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Operation completed successfully!",
            type: ToasterType.success,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Success", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Operation completed successfully!",
  type: ToasterType.success,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Error Toaster Demo
class ErrorToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ErrorToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Something went wrong!",
            type: ToasterType.error,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Error", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Something went wrong!",
  type: ToasterType.error,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Warning Toaster Demo
class WarningToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const WarningToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Please check your input!",
            type: ToasterType.warning,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        child: const Text("Warning", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Please check your input!",
  type: ToasterType.warning,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Info Toaster Demo
class InfoToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const InfoToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Here's some helpful information!",
            type: ToasterType.info,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text("Info", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Here's some helpful information!",
  type: ToasterType.info,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Top Position Toaster Demo
class TopToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TopToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Top position toaster",
            type: ToasterType.info,
            position: ToasterPosition.top,
          );
        },
        child: const Text("Top"),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Top position toaster",
  type: ToasterType.info,
  position: ToasterPosition.top,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Center Position Toaster Demo
class CenterToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const CenterToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Center position toaster",
            type: ToasterType.info,
            position: ToasterPosition.center,
          );
        },
        child: const Text("Center"),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Center position toaster",
  type: ToasterType.info,
  position: ToasterPosition.center,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Bottom Position Toaster Demo
class BottomToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const BottomToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Bottom position toaster",
            type: ToasterType.info,
            position: ToasterPosition.bottom,
          );
        },
        child: const Text("Bottom"),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Bottom position toaster",
  type: ToasterType.info,
  position: ToasterPosition.bottom,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Custom Styled Toaster Demo
class CustomToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const CustomToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Custom styled toaster!",
            backgroundColor: Colors.purple,
            borderRadius: 20,
            icon: const Icon(Icons.star, color: Colors.white),
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: const Text("Custom", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Custom styled toaster!",
  backgroundColor: Colors.purple,
  borderRadius: 20,
  icon: Icon(Icons.star, color: Colors.white),
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Toaster with Title Demo
class TitleToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TitleToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            title: "Success!",
            message: "Your file has been uploaded successfully.",
            type: ToasterType.success,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
        child: const Text("With Title", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  title: "Success!",
  message: "Your file has been uploaded successfully.",
  type: ToasterType.success,
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Long Duration Toaster Demo
class LongDurationToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const LongDurationToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "This toaster stays for 8 seconds",
            type: ToasterType.info,
            duration: const Duration(seconds: 8),
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
        child: const Text("Long Duration", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "This toaster stays for 8 seconds",
  type: ToasterType.info,
  duration: Duration(seconds: 8),
);
""",
      onShowCode: onShowCode,
    );
  }
}

/// Non-Dismissible Toaster Demo
class NonDismissibleToasterDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const NonDismissibleToasterDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: ElevatedButton(
        onPressed: () {
          CustomToaster.show(
            context: context,
            message: "Can't dismiss this one manually",
            type: ToasterType.warning,
            dismissible: false,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
        child: const Text("Non-Dismissible", style: TextStyle(color: Colors.white)),
      ),
      snippet: """
CustomToaster.show(
  context: context,
  message: "Can't dismiss this one manually",
  type: ToasterType.warning,
  dismissible: false,
);
""",
      onShowCode: onShowCode,
    );
  }
}
