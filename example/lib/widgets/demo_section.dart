import 'package:flutter/material.dart';

class DemoSection extends StatelessWidget {
  final List<Widget> children;

  const DemoSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
        ),
      ),
    );
  }
}
