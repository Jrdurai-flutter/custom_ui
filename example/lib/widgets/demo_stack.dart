import 'package:flutter/material.dart';

class DemoStack extends StatelessWidget {
  final String? label;            // Title or description of demo
  final Widget child;            // The actual demo widget (button, etc.)
  final String snippet;          // Code snippet string
  final void Function(String) onShowCode; // Callback for "show code" button

   DemoStack({
    super.key,
     this.label, required this.child, required this.snippet, required this.onShowCode,

  });
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Center(child: child),
        Positioned(
          top: 4,
          right: 4,
          child:

          IconButton(
            tooltip: "Show code",
            icon: const Icon(Icons.code),
            onPressed: () => onShowCode(snippet),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 6,
          child: Text(label ??'', style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ),
      ],
    );
  }
}


