import 'package:flutter/material.dart';
import 'package:custom_ui/custom_bottom_nav_bar.dart';
import '../../../widgets/widget_compents.dart';

/// Theme-based Bottom Navigation Demo
class ThemeBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const ThemeBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<ThemeBottomNavDemo> createState() => _ThemeBottomNavDemoState();
}

class _ThemeBottomNavDemoState extends State<ThemeBottomNavDemo> {
  int _currentIndex = 2; // Start with center item selected

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8D5FF), Color(0xFFF0E6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Demo content
          const Center(
            child: Text(
              'Theme-based Bottom Navigation\n(With Center Scan Button)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          
          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              selectedIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
          
          // Code button
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getThemeCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getThemeCode() {
    return '''
CustomBottomNavBar(
  selectedIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
)

// Default items:
const [
  NavItem(icon: Icons.home, label: "Home"),
  NavItem(icon: Icons.shopping_bag_outlined, label: "Cart"),
  NavItem(isCenter: true), // center scan button
  NavItem(icon: Icons.grid_view_rounded, label: "Categories"),
  NavItem(icon: Icons.person_outline, label: "Profile"),
]''';
  }
}

/// Custom Items Bottom Navigation Demo
class CustomItemsBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const CustomItemsBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<CustomItemsBottomNavDemo> createState() => _CustomItemsBottomNavDemoState();
}

class _CustomItemsBottomNavDemoState extends State<CustomItemsBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Custom Items Navigation\n(Music App Style)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              selectedIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              items: const [
                NavItem(icon: Icons.library_music, label: "Library"),
                NavItem(icon: Icons.search, label: "Search"),
                NavItem(isCenter: true), // center play button
                NavItem(icon: Icons.favorite, label: "Favorites"),
                NavItem(icon: Icons.person, label: "Profile"),
              ],
              selectedColor: Colors.purple,
              centerIcon: Icon(Icons.play_arrow, size: 28, color: Colors.white),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getCustomItemsCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getCustomItemsCode() {
    return '''
CustomBottomNavBar(
  selectedIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  items: const [
    NavItem(icon: Icons.library_music, label: "Library"),
    NavItem(icon: Icons.search, label: "Search"),
    NavItem(isCenter: true), // center play button
    NavItem(icon: Icons.favorite, label: "Favorites"),
    NavItem(icon: Icons.person, label: "Profile"),
  ],
  selectedColor: Colors.purple,
  centerIcon: Icon(Icons.play_arrow, size: 28, color: Colors.white),
)''';
  }
}

/// Custom Styling Bottom Navigation Demo
class CustomStylingBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const CustomStylingBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<CustomStylingBottomNavDemo> createState() => _CustomStylingBottomNavDemoState();
}

class _CustomStylingBottomNavDemoState extends State<CustomStylingBottomNavDemo> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Custom Styling Navigation\n(Dark Theme)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              selectedIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              items: const [
                NavItem(icon: Icons.dashboard, label: "Dashboard"),
                NavItem(icon: Icons.analytics, label: "Analytics"),
                NavItem(isCenter: true), // center add button
                NavItem(icon: Icons.notifications, label: "Alerts"),
                NavItem(icon: Icons.settings, label: "Settings"),
              ],
              backgroundColor: Colors.black87,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[400],
              borderRadius: 25,
              centerIcon: const Icon(Icons.add, size: 28, color: Colors.white),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code, color: Colors.white),
              onPressed: () => widget.onShowCode(_getCustomStylingCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getCustomStylingCode() {
    return '''
CustomBottomNavBar(
  selectedIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  items: const [
    NavItem(icon: Icons.dashboard, label: "Dashboard"),
    NavItem(icon: Icons.analytics, label: "Analytics"),
    NavItem(isCenter: true), // center add button
    NavItem(icon: Icons.notifications, label: "Alerts"),
    NavItem(icon: Icons.settings, label: "Settings"),
  ],
  backgroundColor: Colors.black87,
  selectedColor: Colors.orange,
  unselectedColor: Colors.grey[400],
  borderRadius: 25,
  centerIcon: Icon(Icons.add, size: 28, color: Colors.white),
)''';
  }
}

/// Theme Button Demos
class ThemeButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ThemeButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          CustomThemeButton(
            text: "Elevated",
            type: CustomButtonType.elevated,
            onPressed: () {},
          ),
          CustomThemeButton(
            text: "Filled",
            type: CustomButtonType.filled,
            onPressed: () {},
          ),
          CustomThemeButton(
            text: "Tonal",
            type: CustomButtonType.tonal,
            onPressed: () {},
          ),
          CustomThemeButton(
            text: "Outlined",
            type: CustomButtonType.outlined,
            onPressed: () {},
          ),
          CustomThemeButton(
            text: "Text",
            type: CustomButtonType.text,
            onPressed: () {},
          ),
        ],
      ),
      snippet: '''
// Elevated Button
CustomThemeButton(
  text: "Elevated",
  type: CustomButtonType.elevated,
  onPressed: () {},
)

// Filled Button
CustomThemeButton(
  text: "Filled",
  type: CustomButtonType.filled,
  onPressed: () {},
)

// Tonal Button
CustomThemeButton(
  text: "Tonal",
  type: CustomButtonType.tonal,
  onPressed: () {},
)''',
      onShowCode: onShowCode,
    );
  }
}

/// Theme TextField Demo
class ThemeTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ThemeTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: Column(
        children: [
          CustomThemeTextField(
            label: "Outlined TextField",
            hint: "Enter text here",
            style: CustomTextFieldStyle.outlined,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 16),
          CustomThemeTextField(
            label: "Filled TextField",
            hint: "Enter text here",
            style: CustomTextFieldStyle.filled,
            prefixIcon: const Icon(Icons.email),
          ),
        ],
      ),
      snippet: '''
// Outlined TextField
CustomThemeTextField(
  label: "Outlined TextField",
  hint: "Enter text here",
  style: CustomTextFieldStyle.outlined,
  prefixIcon: Icon(Icons.person),
)

// Filled TextField
CustomThemeTextField(
  label: "Filled TextField",
  hint: "Enter text here",
  style: CustomTextFieldStyle.filled,
  prefixIcon: Icon(Icons.email),
)''',
      onShowCode: onShowCode,
    );
  }
}
