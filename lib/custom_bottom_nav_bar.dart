import 'package:flutter/material.dart';

class NavItem {
  final IconData? icon;
  final String? label;
  final bool isCenter;

  const NavItem({this.icon, this.label, this.isCenter = false});
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<NavItem>? items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? centerIcon;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.centerIcon,
  });

  List<NavItem> get navItems => items ?? const [
    NavItem(icon: Icons.home, label: "Home"),
    NavItem(icon: Icons.shopping_bag_outlined, label: "Cart"),
    NavItem(isCenter: true), // center scan button
    NavItem(icon: Icons.grid_view_rounded, label: "Categories"),
    NavItem(icon: Icons.person_outline, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final effectiveSelectedColor = selectedColor ?? colors.primary;
    final effectiveUnselectedColor = unselectedColor ?? colors.onSurfaceVariant;
    final effectiveBackgroundColor = backgroundColor ?? colors.surface;

    return SafeArea(
      bottom: true,
      child: Container(
        margin: margin ?? const EdgeInsets.all(16),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navItems.length, (index) {
            final item = navItems[index];
            final isSelected = selectedIndex == index;

            if (item.isCenter) {
              return InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: effectiveSelectedColor,
                  ),
                  child: centerIcon ?? 
                    Icon(
                      Icons.qr_code_scanner,
                      size: 28,
                      color: colors.onPrimary,
                    ),
                ),
              );
            }

            return InkWell(
              onTap: () => onTap(index),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? effectiveSelectedColor : effectiveUnselectedColor,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color:
                          isSelected ? effectiveSelectedColor : effectiveUnselectedColor,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// Enhanced Custom Button (Theme-driven)
enum CustomButtonType { elevated, outlined, text, filled, tonal }

enum ButtonIconPosition { prefix, suffix }

class CustomThemeButton extends StatelessWidget {
  final String text;
  final CustomButtonType type;
  final Icon? icon;
  final ButtonIconPosition iconPosition;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Size? minimumSize;

  const CustomThemeButton({
    super.key,
    required this.text,
    required this.type,
    this.icon,
    this.iconPosition = ButtonIconPosition.prefix,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.padding,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && iconPosition == ButtonIconPosition.prefix) ...[
          icon!,
          const SizedBox(width: 8),
        ],
        Text(text),
        if (icon != null && iconPosition == ButtonIconPosition.suffix) ...[
          const SizedBox(width: 8),
          icon!,
        ],
      ],
    );

    final buttonStyle = ButtonStyle(
      backgroundColor: backgroundColor != null 
        ? WidgetStateProperty.all(backgroundColor)
        : null,
      foregroundColor: foregroundColor != null 
        ? WidgetStateProperty.all(foregroundColor)
        : null,
      shape: borderRadius != null 
        ? WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          )
        : null,
      padding: padding != null 
        ? WidgetStateProperty.all(padding)
        : null,
      minimumSize: minimumSize != null 
        ? WidgetStateProperty.all(minimumSize)
        : null,
    );

    switch (type) {
      case CustomButtonType.elevated:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? colors.primary,
            foregroundColor: foregroundColor ?? colors.onPrimary,
          ).merge(buttonStyle),
          onPressed: onPressed,
          child: child,
        );
      case CustomButtonType.filled:
        return FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor ?? colors.primary,
            foregroundColor: foregroundColor ?? colors.onPrimary,
          ).merge(buttonStyle),
          onPressed: onPressed,
          child: child,
        );
      case CustomButtonType.tonal:
        return FilledButton.tonal(
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor ?? colors.secondaryContainer,
            foregroundColor: foregroundColor ?? colors.onSecondaryContainer,
          ).merge(buttonStyle),
          onPressed: onPressed,
          child: child,
        );
      case CustomButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ?? colors.primary,
          ).merge(buttonStyle),
          onPressed: onPressed,
          child: child,
        );
      case CustomButtonType.text:
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor ?? colors.primary,
          ).merge(buttonStyle),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}

/// Enhanced Custom TextField (Theme-driven)
enum CustomTextFieldStyle { outlined, filled, borderless }

class CustomThemeTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final CustomTextFieldStyle style;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomThemeTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.style = CustomTextFieldStyle.outlined,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.contentPadding,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final effectiveBorderRadius = borderRadius ?? 12;

    final OutlineInputBorder rounded = OutlineInputBorder(
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      borderSide: BorderSide(
        color: borderColor ?? colors.outline,
      ),
    );

    final InputDecoration decoration = InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: style == CustomTextFieldStyle.filled,
      fillColor: style == CustomTextFieldStyle.filled 
        ? (fillColor ?? colors.surfaceVariant) 
        : null,
      enabledBorder: style == CustomTextFieldStyle.outlined
          ? rounded
          : style == CustomTextFieldStyle.filled
              ? rounded.copyWith(borderSide: BorderSide.none)
              : InputBorder.none,
      focusedBorder: style == CustomTextFieldStyle.outlined
          ? rounded.copyWith(borderSide: BorderSide(
              color: borderColor ?? colors.primary,
              width: 2,
            ))
          : style == CustomTextFieldStyle.filled
              ? rounded.copyWith(borderSide: BorderSide.none)
              : InputBorder.none,
      border: style == CustomTextFieldStyle.outlined ? rounded : InputBorder.none,
      contentPadding: contentPadding ?? 
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: decoration,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }
}
