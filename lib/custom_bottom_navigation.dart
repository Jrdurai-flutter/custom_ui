import 'package:flutter/material.dart';

/// Custom Bottom Navigation Item
class CustomBottomNavItem {
  final IconData icon;
  final String label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? customIcon;
  final Widget? activeIcon;

  const CustomBottomNavItem({
    required this.icon,
    required this.label,
    this.activeColor,
    this.inactiveColor,
    this.customIcon,
    this.activeIcon,
  });
}

/// Bottom Navigation Bar Styles
enum BottomNavStyle {
  floating,
  fixed,
  pill,
  minimal,
}

/// Custom Bottom Navigation Bar
class CustomBottomNavigation extends StatelessWidget {
  final List<CustomBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final BottomNavStyle style;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? height;
  final bool showLabels;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final double? iconSize;
  final Color? indicatorColor;
  final double? indicatorHeight;
  final double? indicatorWidth;
  final BorderRadius? indicatorBorderRadius;

  const CustomBottomNavigation({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.style = BottomNavStyle.floating,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.margin,
    this.padding,
    this.borderRadius,
    this.height,
    this.showLabels = true,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.iconSize,
    this.indicatorColor,
    this.indicatorHeight,
    this.indicatorWidth,
    this.indicatorBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _getMargin(),
      child: Material(
        elevation: _getElevation(),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        color: _getBackgroundColor(context),
        child: Container(
          height: height ?? _getHeight(),
          padding: _getPadding(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_getBorderRadius()),
            color: _getBackgroundColor(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == currentIndex;
              
              return Expanded(
                child: _buildNavItem(context, item, index, isSelected),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, CustomBottomNavItem item, int index, bool isSelected) {
    final theme = Theme.of(context);
    final selectedColor = selectedItemColor ?? item.activeColor ?? theme.primaryColor;
    final unselectedColor = unselectedItemColor ?? item.inactiveColor ?? Colors.grey;
    
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(_getBorderRadius()),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with indicator
            Stack(
              alignment: Alignment.center,
              children: [
                // Background indicator for selected item
                if (isSelected && style == BottomNavStyle.pill)
                  Container(
                    width: indicatorWidth ?? 60,
                    height: indicatorHeight ?? 32,
                    decoration: BoxDecoration(
                      color: indicatorColor ?? selectedColor.withOpacity(0.2),
                      borderRadius: indicatorBorderRadius ?? BorderRadius.circular(16),
                    ),
                  ),
                
                // Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  child: _buildIcon(item, isSelected, selectedColor, unselectedColor),
                ),
              ],
            ),
            
            // Bottom indicator line
            if (isSelected && style == BottomNavStyle.fixed)
              Container(
                width: indicatorWidth ?? 24,
                height: indicatorHeight ?? 2,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: indicatorColor ?? selectedColor,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            
            // Label
            if (_shouldShowLabel(isSelected))
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item.label,
                  style: _getLabelStyle(context, isSelected, selectedColor, unselectedColor),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(CustomBottomNavItem item, bool isSelected, Color selectedColor, Color unselectedColor) {
    Widget iconWidget;
    
    if (isSelected && item.activeIcon != null) {
      iconWidget = item.activeIcon!;
    } else if (item.customIcon != null) {
      iconWidget = item.customIcon!;
    } else {
      iconWidget = Icon(
        item.icon,
        size: iconSize ?? 24,
        color: isSelected ? selectedColor : unselectedColor,
      );
    }
    
    return iconWidget;
  }

  bool _shouldShowLabel(bool isSelected) {
    if (!showLabels) return false;
    if (isSelected && !showSelectedLabels) return false;
    if (!isSelected && !showUnselectedLabels) return false;
    return true;
  }

  TextStyle _getLabelStyle(BuildContext context, bool isSelected, Color selectedColor, Color unselectedColor) {
    final baseStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12,
    ) ?? const TextStyle(fontSize: 12);
    
    if (isSelected) {
      return selectedLabelStyle?.copyWith(color: selectedColor) ?? 
             baseStyle.copyWith(
               color: selectedColor,
               fontWeight: FontWeight.w600,
             );
    } else {
      return unselectedLabelStyle?.copyWith(color: unselectedColor) ?? 
             baseStyle.copyWith(color: unselectedColor);
    }
  }

  EdgeInsets _getMargin() {
    if (margin != null) return margin!;
    
    switch (style) {
      case BottomNavStyle.floating:
        return const EdgeInsets.all(16);
      case BottomNavStyle.pill:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
      case BottomNavStyle.fixed:
      case BottomNavStyle.minimal:
        return EdgeInsets.zero;
    }
  }

  EdgeInsets _getPadding() {
    if (padding != null) return padding!;
    
    switch (style) {
      case BottomNavStyle.floating:
      case BottomNavStyle.pill:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 8);
      case BottomNavStyle.fixed:
      case BottomNavStyle.minimal:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 12);
    }
  }

  double _getElevation() {
    if (elevation != null) return elevation!;
    
    switch (style) {
      case BottomNavStyle.floating:
        return 8;
      case BottomNavStyle.pill:
        return 4;
      case BottomNavStyle.fixed:
        return 2;
      case BottomNavStyle.minimal:
        return 0;
    }
  }

  double _getBorderRadius() {
    if (borderRadius != null) return borderRadius!;
    
    switch (style) {
      case BottomNavStyle.floating:
        return 24;
      case BottomNavStyle.pill:
        return 30;
      case BottomNavStyle.fixed:
        return 12;
      case BottomNavStyle.minimal:
        return 0;
    }
  }

  double _getHeight() {
    switch (style) {
      case BottomNavStyle.floating:
      case BottomNavStyle.pill:
        return 70;
      case BottomNavStyle.fixed:
      case BottomNavStyle.minimal:
        return 80;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (style) {
      case BottomNavStyle.floating:
      case BottomNavStyle.pill:
      case BottomNavStyle.fixed:
        return Theme.of(context).scaffoldBackgroundColor;
      case BottomNavStyle.minimal:
        return Colors.transparent;
    }
  }
}

/// Preset Bottom Navigation Bars
class CustomBottomNavigationPresets {
  /// Creates a floating bottom navigation like in the image
  static CustomBottomNavigation floating({
    required List<CustomBottomNavItem> items,
    required int currentIndex,
    required ValueChanged<int> onTap,
    Color? backgroundColor,
    Color? selectedItemColor,
  }) {
    return CustomBottomNavigation(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      style: BottomNavStyle.floating,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor,
      elevation: 12,
      borderRadius: 24,
      margin: const EdgeInsets.all(16),
      indicatorColor: selectedItemColor?.withOpacity(0.2),
    );
  }

  /// Creates a pill-style bottom navigation
  static CustomBottomNavigation pill({
    required List<CustomBottomNavItem> items,
    required int currentIndex,
    required ValueChanged<int> onTap,
    Color? backgroundColor,
    Color? selectedItemColor,
  }) {
    return CustomBottomNavigation(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      style: BottomNavStyle.pill,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor,
      showLabels: false,
      indicatorHeight: 32,
      indicatorWidth: 60,
    );
  }

  /// Creates a fixed bottom navigation with line indicator
  static CustomBottomNavigation fixed({
    required List<CustomBottomNavItem> items,
    required int currentIndex,
    required ValueChanged<int> onTap,
    Color? backgroundColor,
    Color? selectedItemColor,
  }) {
    return CustomBottomNavigation(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      style: BottomNavStyle.fixed,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor,
      indicatorHeight: 3,
      indicatorWidth: 24,
    );
  }
}
