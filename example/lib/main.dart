import 'package:example/common/themes.dart';
import 'package:example/pages/bottom_nav/bottom_nav_page.dart';
import 'package:example/pages/buttons/buttons_page.dart';
import 'package:example/pages/cards/cards_page.dart';
import 'package:example/pages/date_formater/date_formate_page.dart';
import 'package:example/pages/responsive/responsive_page.dart';
import 'package:example/pages/snackbar/snackbar_page.dart';
import 'package:example/pages/text_fields/text_fields_page.dart';
import 'package:example/pages/toaster/toaster_page.dart';
import 'package:example/pages/typography/typography_page.dart';
import 'package:example/widgets/enhanced_code_panel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom UI Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  const MyHomePage({Key? key, required this.toggleTheme, required this.isDarkMode})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedComponent = "Button";
  String _codeSnippet = "";
  bool _isCodePanelOpen = false;

  final Map<String, IconData> _componentIcons = {
    "Button": Icons.smart_button,
    "TextField": Icons.text_fields,
    "Typography": Icons.format_size,
    "Toaster": Icons.notifications,
    "Snackbar": Icons.message,
    "Bottom Nav": Icons.navigation,
    "Responsive": Icons.devices,
    "Date Formater": Icons.calendar_month,
    "Cards": Icons.card_membership,
  };

  final Map<String, String> _componentDescriptions = {
    "Button":
        "A collection of versatile and customizable button widgets for every use case.",
    "TextField":
        "A variety of text input fields with different styles and validation options.",
    "Typography":
        "Examples of text styles and typography for a consistent user interface.",
    "Toaster":
        "Display unobtrusive notifications (toasts) with various styles and positions.",
    "Snackbar":
        "Show Material Design snackbars with custom actions, styles, and content.",
    "Bottom Nav":
        "A customizable bottom navigation bar for easy app navigation.",
    "Responsive":
        "A widget that helps in creating responsive layouts for different screen sizes.",
    "Date Formater":
        "Utility functions to format dates and times in a user-friendly way.",
    "Cards":
        "A card component with a modern, elevated design for displaying content.",
  };

  Widget _buildPreview() {
    switch (_selectedComponent) {
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
      case "Cards":
        return CardsPage(onShowCode: _openSnippet);
      default:
        return const Center(child: Text("Select a component"));
    }
  }

  void _openSnippet(String snippet) {
    setState(() {
      _codeSnippet = snippet;
      _isCodePanelOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isExtended = MediaQuery.of(context).size.width > 800;
    final selectedIndex = _componentIcons.keys.toList().indexOf(_selectedComponent);

    return Scaffold(
      appBar: AppBar(
        title: Text("Component Showcase - $_selectedComponent"),
        actions: [
          IconButton(
            icon: Icon(
                widget.isDarkMode ? Icons.dark_mode : Icons.light_mode_outlined),
            onPressed: widget.toggleTheme,
            tooltip: "Toggle Theme",
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: isExtended,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedComponent = _componentIcons.keys.elementAt(index);
              });
            },
            leading: isExtended
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Components",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : null,
            destinations: _componentIcons.entries.map((entry) {
              return NavigationRailDestination(
                icon: Icon(entry.value),
                label: Text(entry.key),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Padding(
                    key: ValueKey<String>(_selectedComponent),
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedComponent,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _componentDescriptions[_selectedComponent] ?? "",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: _buildPreview(),
                        ),
                      ],
                    ),
                  ),
                ),
                EnhancedCodePanel(
                  code: _codeSnippet,
                  isOpen: _isCodePanelOpen,
                  onClose: () {
                    setState(() {
                      _isCodePanelOpen = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
