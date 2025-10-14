import 'package:flutter/material.dart';

class DemoRow extends StatelessWidget {
  final Widget demo;
  final String snippet;
  final void Function(String) onShowCode;

  const DemoRow({
    super.key,
    required this.demo,
    required this.snippet,
    required this.onShowCode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: demo,
            ),
          ),
          const SizedBox(width: 12),

          IconButton(
            tooltip: "Show code",
            icon: const Icon(Icons.code),
            onPressed: () => onShowCode(snippet),
          ),
        ],
      ),
    );
  }
}


