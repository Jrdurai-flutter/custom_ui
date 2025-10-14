import 'package:example/pages/responsive/responsive_page.dart';
import 'package:flutter/material.dart';
// Imports for pages
import 'pages/buttons/buttons_page.dart';
import 'pages/date_formater/date_formate_page.dart';
import 'pages/text_fields/text_fields_page.dart';
import 'pages/typography/typography_page.dart';
import 'pages/toaster/toaster_page.dart';
import 'pages/snackbar/snackbar_page.dart';
import 'pages/bottom_nav/bottom_nav_page.dart';
import 'widgets/enhanced_code_panel.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  String selected = "Button";
  String codeSnippet = "";
  bool isCodePanelOpen = false;
  double fontSize = 20;
  bool isBold = false;
  bool isItalic = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                // Side Menu
                NavigationRail(
                  backgroundColor: Colors.grey[200],
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.smart_button),
                      label: Text("Button"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.text_fields),
                      label: Text("TextField"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.format_size),
                      label: Text("Typography"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.notifications),
                      label: Text("Toaster"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.message),
                      label: Text("Snackbar"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.navigation),
                      label: Text("Bottom Nav"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.devices),
                      label: Text("Responsive"),
                    ),  NavigationRailDestination(
                      icon: Icon(Icons.calendar_month),
                      label: Text("Date Formater"),
                    ),
                  ],
                  selectedIndex: selected == "Button"
                      ? 0
                      : selected == "TextField"
                      ? 1
                      : selected == "Typography"
                      ? 2
                      : selected == "Toaster"
                      ? 3
                      : selected == "Snackbar"
                      ? 4
                      : selected == "Bottom Nav"
                      ? 5
                      : selected == "Responsive"
                      ? 6:7,
                  onDestinationSelected: (index) {
                    setState(() {
                      if (index == 0) {
                        selected = "Button";
                      } else if (index == 1) {
                        selected = "TextField";
                      } else if (index == 2) {
                        selected = "Typography";
                      } else if (index == 3) {
                        selected = "Toaster";
                      } else if (index == 4) {
                        selected = "Snackbar";
                      } else if (index == 5) {
                        selected = "Bottom Nav";
                      } else if (index == 6) {
                        selected = "Responsive";
                      } else {
                        selected = "Date Formater";
                      }
                      isCodePanelOpen = false;
                    });
                  },
                ),
                const VerticalDivider(width: 1),
                // Preview Area only
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(child: _buildPreview()),
                  ),
                ),
              ],
            ),

            // Enhanced code panel with copy functionality
            EnhancedCodePanel(
              code: codeSnippet,
              isOpen: isCodePanelOpen,
              onClose: () {
                setState(() {
                  isCodePanelOpen = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Preview UI
  Widget _buildPreview() {
    switch (selected) {
      case "Button":
        return ButtonsPage(onShowCode: _openSnippet);

      case "TextField":
        return TextFieldsPage(onShowCode: _openSnippet);

      case "Typography":
        return TypographyShowcasePage(onShowCode: _openSnippet);

      case "Toaster":
        return ToasterPage(onShowCode: _openSnippet);

      case "Snackbar":
        return SnackbarPage(onShowCode: _openSnippet);

      case "Bottom Nav":
        return BottomNavPage(onShowCode: _openSnippet);

      case "Responsive":
        return ResponsivePage(onShowCode: _openSnippet);

        case "Date Formater":
        return DateFormatePage(onShowCode: _openSnippet);

      default:
        return const SizedBox();
    }
  }

  void _openSnippet(String snippet) {
    setState(() {
      codeSnippet = snippet;
      isCodePanelOpen = true;
    });
  }
}