import 'package:flutter/material.dart';
import 'package:custom_ui/custom_bottom_navigation.dart';
import 'package:custom_ui/custom_bottom_nav_bar.dart';
import '../../widgets/widget_compents.dart';
import 'components/bottom_nav_bar_demos.dart';

class BottomNavPage extends StatefulWidget {
  final void Function(String) onShowCode;

  const BottomNavPage({super.key, required this.onShowCode});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return DemoSection(
      children: [
        const Text(
          'Bottom Navigation Styles (1-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        
        // Floating Style Demo
        FloatingBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Pill Style Demo
        PillBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Fixed Style Demo
        FixedBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Minimal Style Demo
        MinimalBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        const Text(
          'Customization Examples (1-column grid)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        
        // Custom Colors Demo
        CustomColorsBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Custom Icons Demo
        CustomIconsBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // No Labels Demo
        NoLabelsBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        const Text(
          'Theme-based Components (New)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        
        // Theme Bottom Nav Demo
        ThemeBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Custom Items Demo
        CustomItemsBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Custom Styling Demo
        CustomStylingBottomNavDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        const Text(
          'Theme Buttons & TextFields',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        
        // Theme Button Demo
        ThemeButtonDemo(onShowCode: widget.onShowCode),
        const SizedBox(height: 24),
        
        // Theme TextField Demo
        ThemeTextFieldDemo(onShowCode: widget.onShowCode),
      ],
    );
  }
}

/// Floating Bottom Navigation Demo (like in the image)
class FloatingBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const FloatingBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<FloatingBottomNavDemo> createState() => _FloatingBottomNavDemoState();
}

class _FloatingBottomNavDemoState extends State<FloatingBottomNavDemo> {
  int _currentIndex = 2; // Start with middle item selected (like in image)

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
              'Floating Bottom Navigation\n(Like in your image)',
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
            child: CustomBottomNavigationPresets.floating(
              items: const [
                CustomBottomNavItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                ),
                CustomBottomNavItem(
                  icon: Icons.shopping_bag_outlined,
                  label: 'Cart',
                ),
                CustomBottomNavItem(
                  icon: Icons.pets,
                  label: 'Pets',
                ),
                CustomBottomNavItem(
                  icon: Icons.grid_view_outlined,
                  label: 'Categories',
                ),
                CustomBottomNavItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedItemColor: const Color(0xFF7B4397),
            ),
          ),
          
          // Code button
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getFloatingCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getFloatingCode() {
    return '''
CustomBottomNavigationPresets.floating(
  items: const [
    CustomBottomNavItem(
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    CustomBottomNavItem(
      icon: Icons.shopping_bag_outlined,
      label: 'Cart',
    ),
    CustomBottomNavItem(
      icon: Icons.pets,
      label: 'Pets',
    ),
    CustomBottomNavItem(
      icon: Icons.grid_view_outlined,
      label: 'Categories',
    ),
    CustomBottomNavItem(
      icon: Icons.person_outline,
      label: 'Profile',
    ),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  selectedItemColor: Color(0xFF7B4397),
)''';
  }
}

/// Pill Style Bottom Navigation Demo
class PillBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const PillBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<PillBottomNavDemo> createState() => _PillBottomNavDemoState();
}

class _PillBottomNavDemoState extends State<PillBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Pill Style Navigation\n(No Labels)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationPresets.pill(
              items: const [
                CustomBottomNavItem(icon: Icons.home, label: 'Home'),
                CustomBottomNavItem(icon: Icons.search, label: 'Search'),
                CustomBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
                CustomBottomNavItem(icon: Icons.person, label: 'Profile'),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedItemColor: Colors.blue,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getPillCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getPillCode() {
    return '''
CustomBottomNavigationPresets.pill(
  items: const [
    CustomBottomNavItem(icon: Icons.home, label: 'Home'),
    CustomBottomNavItem(icon: Icons.search, label: 'Search'),
    CustomBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
    CustomBottomNavItem(icon: Icons.person, label: 'Profile'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  selectedItemColor: Colors.blue,
)''';
  }
}

/// Fixed Style Bottom Navigation Demo
class FixedBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const FixedBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<FixedBottomNavDemo> createState() => _FixedBottomNavDemoState();
}

class _FixedBottomNavDemoState extends State<FixedBottomNavDemo> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Fixed Style Navigation\n(With Line Indicator)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationPresets.fixed(
              items: const [
                CustomBottomNavItem(icon: Icons.dashboard, label: 'Dashboard'),
                CustomBottomNavItem(icon: Icons.analytics, label: 'Analytics'),
                CustomBottomNavItem(icon: Icons.notifications, label: 'Notifications'),
                CustomBottomNavItem(icon: Icons.settings, label: 'Settings'),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedItemColor: Colors.green,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getFixedCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getFixedCode() {
    return '''
CustomBottomNavigationPresets.fixed(
  items: const [
    CustomBottomNavItem(icon: Icons.dashboard, label: 'Dashboard'),
    CustomBottomNavItem(icon: Icons.analytics, label: 'Analytics'),
    CustomBottomNavItem(icon: Icons.notifications, label: 'Notifications'),
    CustomBottomNavItem(icon: Icons.settings, label: 'Settings'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  selectedItemColor: Colors.green,
)''';
  }
}

/// Minimal Style Bottom Navigation Demo
class MinimalBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const MinimalBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<MinimalBottomNavDemo> createState() => _MinimalBottomNavDemoState();
}

class _MinimalBottomNavDemoState extends State<MinimalBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Minimal Style Navigation\n(No Background)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(
              items: const [
                CustomBottomNavItem(icon: Icons.music_note, label: 'Music'),
                CustomBottomNavItem(icon: Icons.video_library, label: 'Videos'),
                CustomBottomNavItem(icon: Icons.photo_library, label: 'Photos'),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              style: BottomNavStyle.minimal,
              selectedItemColor: Colors.purple,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getMinimalCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getMinimalCode() {
    return '''
CustomBottomNavigation(
  items: const [
    CustomBottomNavItem(icon: Icons.music_note, label: 'Music'),
    CustomBottomNavItem(icon: Icons.video_library, label: 'Videos'),
    CustomBottomNavItem(icon: Icons.photo_library, label: 'Photos'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  style: BottomNavStyle.minimal,
  selectedItemColor: Colors.purple,
)''';
  }
}

/// Custom Colors Bottom Navigation Demo
class CustomColorsBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const CustomColorsBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<CustomColorsBottomNavDemo> createState() => _CustomColorsBottomNavDemoState();
}

class _CustomColorsBottomNavDemoState extends State<CustomColorsBottomNavDemo> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
              'Custom Colors & Gradient\n(Dark Background)',
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
            child: CustomBottomNavigation(
              items: const [
                CustomBottomNavItem(icon: Icons.explore, label: 'Explore'),
                CustomBottomNavItem(icon: Icons.map, label: 'Map'),
                CustomBottomNavItem(icon: Icons.bookmark, label: 'Saved'),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              style: BottomNavStyle.floating,
              backgroundColor: Colors.white.withOpacity(0.9),
              selectedItemColor: const Color(0xFF667eea),
              unselectedItemColor: Colors.grey[600],
              borderRadius: 20,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code, color: Colors.white),
              onPressed: () => widget.onShowCode(_getCustomColorsCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getCustomColorsCode() {
    return '''
CustomBottomNavigation(
  items: const [
    CustomBottomNavItem(icon: Icons.explore, label: 'Explore'),
    CustomBottomNavItem(icon: Icons.map, label: 'Map'),
    CustomBottomNavItem(icon: Icons.bookmark, label: 'Saved'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  style: BottomNavStyle.floating,
  backgroundColor: Colors.white.withOpacity(0.9),
  selectedItemColor: Color(0xFF667eea),
  unselectedItemColor: Colors.grey[600],
  borderRadius: 20,
)''';
  }
}

/// Custom Icons Bottom Navigation Demo
class CustomIconsBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const CustomIconsBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<CustomIconsBottomNavDemo> createState() => _CustomIconsBottomNavDemoState();
}

class _CustomIconsBottomNavDemoState extends State<CustomIconsBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Custom Active/Inactive Icons\n(Different icons for states)',
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
            child: CustomBottomNavigation(
              items: [
                CustomBottomNavItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  activeIcon: Icon(Icons.home, size: 24, color: Colors.orange),
                ),
                CustomBottomNavItem(
                  icon: Icons.favorite_outline,
                  label: 'Favorites',
                  activeIcon: Icon(Icons.favorite, size: 24, color: Colors.orange),
                ),
                CustomBottomNavItem(
                  icon: Icons.shopping_cart_outlined,
                  label: 'Cart',
                  activeIcon: Icon(Icons.shopping_cart, size: 24, color: Colors.orange),
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              style: BottomNavStyle.floating,
              backgroundColor: Colors.grey[900],
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code, color: Colors.white),
              onPressed: () => widget.onShowCode(_getCustomIconsCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getCustomIconsCode() {
    return '''
CustomBottomNavigation(
  items: [
    CustomBottomNavItem(
      icon: Icons.home_outlined,
      label: 'Home',
      activeIcon: Icon(Icons.home, size: 24, color: Colors.orange),
    ),
    CustomBottomNavItem(
      icon: Icons.favorite_outline,
      label: 'Favorites',
      activeIcon: Icon(Icons.favorite, size: 24, color: Colors.orange),
    ),
    CustomBottomNavItem(
      icon: Icons.shopping_cart_outlined,
      label: 'Cart',
      activeIcon: Icon(Icons.shopping_cart, size: 24, color: Colors.orange),
    ),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  style: BottomNavStyle.floating,
  backgroundColor: Colors.grey[900],
  selectedItemColor: Colors.orange,
  unselectedItemColor: Colors.grey[400],
)''';
  }
}

/// No Labels Bottom Navigation Demo
class NoLabelsBottomNavDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const NoLabelsBottomNavDemo({super.key, required this.onShowCode});

  @override
  State<NoLabelsBottomNavDemo> createState() => _NoLabelsBottomNavDemoState();
}

class _NoLabelsBottomNavDemoState extends State<NoLabelsBottomNavDemo> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'No Labels Navigation\n(Icons Only)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(
              items: const [
                CustomBottomNavItem(icon: Icons.call, label: 'Calls'),
                CustomBottomNavItem(icon: Icons.chat, label: 'Chats'),
                CustomBottomNavItem(icon: Icons.video_call, label: 'Video'),
                CustomBottomNavItem(icon: Icons.contacts, label: 'Contacts'),
                CustomBottomNavItem(icon: Icons.more_horiz, label: 'More'),
              ],
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              style: BottomNavStyle.floating,
              showLabels: false,
              selectedItemColor: Colors.teal,
              backgroundColor: Colors.white,
              indicatorColor: Colors.teal.withOpacity(0.2),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              tooltip: "Show code",
              icon: const Icon(Icons.code),
              onPressed: () => widget.onShowCode(_getNoLabelsCode()),
            ),
          ),
        ],
      ),
    );
  }

  String _getNoLabelsCode() {
    return '''
CustomBottomNavigation(
  items: const [
    CustomBottomNavItem(icon: Icons.call, label: 'Calls'),
    CustomBottomNavItem(icon: Icons.chat, label: 'Chats'),
    CustomBottomNavItem(icon: Icons.video_call, label: 'Video'),
    CustomBottomNavItem(icon: Icons.contacts, label: 'Contacts'),
    CustomBottomNavItem(icon: Icons.more_horiz, label: 'More'),
  ],
  currentIndex: _currentIndex,
  onTap: (index) => setState(() => _currentIndex = index),
  style: BottomNavStyle.floating,
  showLabels: false,
  selectedItemColor: Colors.teal,
  backgroundColor: Colors.white,
  indicatorColor: Colors.teal.withOpacity(0.2),
)''';
  }
}
