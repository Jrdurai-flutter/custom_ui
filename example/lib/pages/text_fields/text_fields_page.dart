import 'package:flutter/material.dart';

import '../../widgets/widget_compents.dart';
import 'compents/compents.dart';



class TextFieldsPage extends StatelessWidget {
  const TextFieldsPage({super.key ,required this.onShowCode});
  final void Function(String) onShowCode;

  @override
  Widget build(BuildContext context) {
  return  DemoSection(
  children: [
  const Text(
  'Text fields (3-column grid)',
  style: TextStyle(fontWeight: FontWeight.w600),
  ),
  const SizedBox(height: 8),
  GridView.count(
  crossAxisCount: 3,
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  childAspectRatio: 2.8,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  children: [
  OutlinedTextFieldDemo(onShowCode: onShowCode),
  FilledTextFieldDemo(onShowCode: onShowCode),
  BorderlessTextFieldDemo(onShowCode: onShowCode),
  EmptyOutlinedTextFieldDemo(onShowCode: onShowCode),
  EmptyFilledTextFieldDemo(onShowCode: onShowCode),
  SizedBox(),
  ParagraphOutlinedTextFieldDemo(onShowCode: onShowCode),
  ParagraphFilledTextFieldDemo(onShowCode: onShowCode),

  ],
  ),

    const Text(
      'Addition Text fields ',
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    const SizedBox(height: 8),

    GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        EmailTextFieldDemo(onShowCode: onShowCode),
        NumberTextFieldDemo(onShowCode: onShowCode),
      ],
    ),
  ],
  );}

  }










