import 'package:custom_ui/custom_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/widget_compents.dart';
import 'compents/compents.dart';

class ButtonsPage extends StatelessWidget {
  final void Function(String) onShowCode;

  const ButtonsPage({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      children: [
        Text(
              'Status and shape variants (3-column grid)',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

               GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ActiveButtonDemo(onShowCode: onShowCode),
              SuccessButtonDemo(onShowCode: onShowCode),
              WarningButtonDemo(onShowCode: onShowCode),
              DangerButtonDemo(onShowCode: onShowCode),
              InactiveButtonDemo(onShowCode: onShowCode),
              OutlinedButtonDemo(onShowCode: onShowCode),
              GradientButtonDemo(onShowCode: onShowCode),
              FilledIconButtonDemo(onShowCode: onShowCode),
              OutlinedIconButtonDemo(onShowCode: onShowCode),
              CircularButtonDemo(onShowCode: onShowCode),
            ],
          ),
  const Text('Prefix/Suffix icons across styles (3-column grid)',
              style: TextStyle(fontWeight: FontWeight.w600)),

        GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OutlinedPrefixButtonDemo(onShowCode: onShowCode),
            OutlinedSuffixButtonDemo(onShowCode: onShowCode),
            TextPrefixButtonDemo(onShowCode: onShowCode),
            ElevatedPrefixButtonDemo(onShowCode: onShowCode),
            ElevatedSuffixButtonDemo(onShowCode: onShowCode),
            GradientSuffixButtonDemo(onShowCode: onShowCode),
          ],
        ),
         
        AnimatedStateButtonsDemo(onShowCode: onShowCode),
      ],
   );
  }
}


/*import 'package:flutter/material.dart';
import 'package:custom_ui/custom_button.dart';
import '../../../widgets/demo_row.dart';*/

/// ------------------ Active Button Demo ------------------
class ActiveButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ActiveButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Active",
        type: ButtonType.elevated,
        color: Colors.blue,
        radius: 0,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Active",
  type: ButtonType.elevated,
  color: Colors.blue,
  radius: 0,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Success Button Demo ------------------
class SuccessButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const SuccessButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Success",
        type: ButtonType.elevated,
        color: Colors.green,
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Success",
  type: ButtonType.elevated,
  color: Colors.green,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Warning Button Demo ------------------
class WarningButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const WarningButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Warning",
        type: ButtonType.outlined,
        color: Colors.amber,
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Warning",
  type: ButtonType.outlined,
  color: Colors.amber,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Danger Button Demo ------------------
class DangerButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const DangerButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Danger",
        type: ButtonType.elevated,
        color: Colors.red,
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Danger",
  type: ButtonType.elevated,
  color: Colors.red,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Inactive Button Demo ------------------
class InactiveButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const InactiveButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Inactive",
        type: ButtonType.elevated,
        color: Colors.grey,
        radius: 8,
        onPressed: (){},
      ),
      snippet: """
// Simulate disabled by setting onPressed to null
CustomButton(
  text: "Inactive",
  type: ButtonType.elevated,
  color: Colors.grey,
  radius: 8,
  onPressed: null,
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Outlined Button Demo ------------------
class OutlinedButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Outlined",
        type: ButtonType.outlined,
        color: Colors.blue,
        radius: 0,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Outlined",
  type: ButtonType.outlined,
  color: Colors.blue,
  radius: 0,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Gradient Button Demo ------------------
class GradientButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const GradientButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Gradient",
        type: ButtonType.gradient,
        gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Gradient",
  type: ButtonType.gradient,
  gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Filled Icon Button Demo ------------------
class FilledIconButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FilledIconButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Like",
        type: ButtonType.filledIcon,
        icon: const Icon(Icons.favorite, color: Colors.white),
        color: Colors.pink,
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Like",
  type: ButtonType.filledIcon,
  icon: Icon(Icons.favorite, color: Colors.white),
  color: Colors.pink,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Outlined Icon Button Demo ------------------
class OutlinedIconButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedIconButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Star",
        type: ButtonType.outlinedIcon,
        icon: const Icon(Icons.star, color: Colors.blue),
        color: Colors.blue,
        radius: 8,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Star",
  type: ButtonType.outlinedIcon,
  icon: Icon(Icons.star, color: Colors.blue),
  color: Colors.blue,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

/// ------------------ Circular Button Demo ------------------
class CircularButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const CircularButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Circular",
        type: ButtonType.circular,
        color: Colors.purple,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Circular",
  type: ButtonType.circular,
  color: Colors.purple,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}

