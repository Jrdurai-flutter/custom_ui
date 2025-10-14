import 'package:custom_ui/custom_button.dart';
import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';
import '../../widgets/widget_compents.dart';
import '../buttons/buttons_page.dart';


class DateFormatePage extends StatelessWidget {
  final void Function(String) onShowCode;

   DateFormatePage({super.key, required this.onShowCode});

  final String raw = DateTime.now().toUtc().toIso8601String();


  @override
  Widget build(BuildContext context) {
    return DemoSection(
      children: [
        Text(
          'Status and shape variants (3-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),

        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DemoStack(
              snippet: """CustomeDateTimeFormatter.ddMMyyyy(raw)""",
              onShowCode: onShowCode,
              child: Text("dd/MM/yyyy -> ${CustomeDateTimeFormatter.ddMMyyyy(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.ddMMyyyyDash(raw)""",
              onShowCode: onShowCode,
              child: Text("dd-MM-yyyy -> ${CustomeDateTimeFormatter.ddMMyyyyDash(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.yyyyMMdd(raw)""",
              onShowCode:onShowCode,
              child: Text("yyyy-MM-dd -> ${CustomeDateTimeFormatter.yyyyMMdd(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.ddMMyyyyhhmma(raw)""",
              onShowCode:onShowCode,
              child: Text("dd/MM/yyyy hh:mm a -> ${CustomeDateTimeFormatter.ddMMyyyyhhmma(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.ddMMMyyyy(raw)""",
              onShowCode:onShowCode,
              child: Text("dd MMM yyyy -> ${CustomeDateTimeFormatter.ddMMMyyyy(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.mmmddyyyy(raw)""",
              onShowCode:onShowCode,
              child: Text("MMM dd, yyyy -> ${CustomeDateTimeFormatter.mmmddyyyy(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.fullDateTime(raw)""",
              onShowCode:onShowCode,
              child: Text("Full -> ${CustomeDateTimeFormatter.fullDateTime(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.onlyTime(raw)""",
              onShowCode:onShowCode,
              child: Text("Only Time -> ${CustomeDateTimeFormatter.onlyTime(raw)}"),
            ),
            DemoStack(
              snippet: """CustomeDateTimeFormatter.relativeDate(raw)""",
              onShowCode:onShowCode,
              child: Text("Relative (Today/Yesterday/Tomorrow) -> ${CustomeDateTimeFormatter.relativeDate(raw)}"),
            ),
          ],
        ),


      ],
    );
  }
}
