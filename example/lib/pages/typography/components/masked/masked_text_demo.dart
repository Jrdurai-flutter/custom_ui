import 'package:flutter/material.dart';
import 'package:custom_ui/custom_ui.dart';


class MaskedTextDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const MaskedTextDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    final t = CustomTypography(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            context,
            title: "📱 Phone Mask",
            codeSnippet: _snippetPhone(),
          ),
          CustomMaskedText(
            text: "9876543210",
            startPosition: 3,
            endLength: 2,
            maskType: MaskType.phone,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "📧 Email Mask",
            codeSnippet: _snippetEmail(),
          ),
          CustomMaskedText(
            text: "rajadurai.dev@gmail.com",
            startPosition: 2,
            endLength: 2,
            maskType: MaskType.email,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "👤 Username Mask",
            codeSnippet: _snippetUsername(),
          ),
          CustomMaskedText(
            text: "Rajadurai",
            startPosition: 3,
            endLength: 1,
            maskType: MaskType.username,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "📅 Date Mask",
            codeSnippet: _snippetDate(),
          ),
          CustomMaskedText(
            text: "2025-11-02",
            startPosition: 0,
            maskType: MaskType.date,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "🤖 Auto Detect (Phone)",
            codeSnippet: _snippetAutoPhone(),
          ),
          CustomMaskedText(
            text: "9345123490",
            startPosition: 3,
            endLength: 2,
            maskType: MaskType.auto,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "🤖 Auto Detect (Email)",
            codeSnippet: _snippetAutoEmail(),
          ),
          CustomMaskedText(
            text: "john.doe@gmail.com",
            startPosition: 2,
            endLength: 1,
            maskType: MaskType.auto,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "🤖 Auto Detect (Date)",
            codeSnippet: _snippetAutoDate(),
          ),
          CustomMaskedText(
            text: "12/03/2024",
            startPosition: 0,
            maskType: MaskType.auto,
            style: t.bodyLarge,
          ),
          const SizedBox(height: 16),

          _sectionTitle(
            context,
            title: "🤖 Auto Detect (Generic String)",
            codeSnippet: _snippetAutoGeneric(),
          ),
          CustomMaskedText(
            text: "ConfidentialInfo",
            startPosition: 3,
            endLength: 3,
            maskType: MaskType.auto,
            style: t.bodyLarge,
          ),
        ],
      ),
    );
  }

  // --------------------------
  // Shared UI section header
  // --------------------------
  Widget _sectionTitle(BuildContext context,
      {required String title, required String codeSnippet}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          tooltip: 'Show code',
          icon: const Icon(Icons.code),
          onPressed: () => onShowCode(codeSnippet),
        ),
      ],
    );
  }

  // --------------------------
  // Code Snippets for examples
  // --------------------------
  String _snippetPhone() => """
CustomMaskedText(
  text: "9876543210",
  startPosition: 3,
  endLength: 2,
  maskType: MaskType.phone,
)
""";

  String _snippetEmail() => """
CustomMaskedText(
  text: "rajadurai.dev@gmail.com",
  startPosition: 2,
  endLength: 2,
  maskType: MaskType.email,
)
""";

  String _snippetUsername() => """
CustomMaskedText(
  text: "Rajadurai",
  startPosition: 3,
  endLength: 1,
  maskType: MaskType.username,
)
""";

  String _snippetDate() => """
CustomMaskedText(
  text: "2025-11-02",
  startPosition: 0,
  maskType: MaskType.date,
)
""";

  String _snippetAutoPhone() => """
CustomMaskedText(
  text: "9345123490",
  startPosition: 3,
  endLength: 2,
  maskType: MaskType.auto,
)
""";

  String _snippetAutoEmail() => """
CustomMaskedText(
  text: "john.doe@gmail.com",
  startPosition: 2,
  endLength: 1,
  maskType: MaskType.auto,
)
""";

  String _snippetAutoDate() => """
CustomMaskedText(
  text: "12/03/2024",
  startPosition: 0,
  maskType: MaskType.auto,
)
""";

  String _snippetAutoGeneric() => """
CustomMaskedText(
  text: "ConfidentialInfo",
  startPosition: 3,
  endLength: 3,
  maskType: MaskType.auto,
)
""";
}
