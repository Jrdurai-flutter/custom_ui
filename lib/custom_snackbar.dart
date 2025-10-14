import 'package:flutter/material.dart';

/// Different snackbar styles
enum SnackbarStyle {
  filled,
  outlined,
  floating,
  minimal,
}

/// Snackbar action button style
enum ActionStyle {
  text,
  elevated,
  outlined,
}

class CustomSnackbar {
  /// Show a custom snackbar with enhanced styling options
  static void show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    SnackbarStyle style = SnackbarStyle.filled,
    ActionStyle actionStyle = ActionStyle.text,
    Color? backgroundColor,
    Color? textColor,
    Color? actionColor,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
    bool showCloseIcon = false,
    double? elevation,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? borderRadius,
    Border? border,
  }) {
    final snackBar = SnackBar(
      content: CustomSnackbarContent(
        message: message,
        icon: icon,
        textColor: textColor,
        style: style,
      ),
      action: (actionLabel != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onActionPressed ?? () {},
              textColor: actionColor,
            )
          : null,
      showCloseIcon: showCloseIcon,
      backgroundColor: _getBackgroundColor(style, backgroundColor),
      elevation: elevation ?? _getElevation(style),
      margin: margin ?? _getMargin(style),
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? _getBorderRadius(style)),
        side: border?.top ?? BorderSide.none,
      ),
      behavior: _getBehavior(style),
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show a success snackbar
  static void showSuccess({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    SnackbarStyle style = SnackbarStyle.filled,
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      style: style,
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  /// Show an error snackbar
  static void showError({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    SnackbarStyle style = SnackbarStyle.filled,
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      style: style,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error, color: Colors.white),
      showCloseIcon: true,
    );
  }

  /// Show a warning snackbar
  static void showWarning({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    SnackbarStyle style = SnackbarStyle.filled,
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      style: style,
      backgroundColor: Colors.orange,
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }

  /// Show an info snackbar
  static void showInfo({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    SnackbarStyle style = SnackbarStyle.filled,
  }) {
    show(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      style: style,
      backgroundColor: Colors.blue,
      icon: const Icon(Icons.info, color: Colors.white),
    );
  }

  static Color? _getBackgroundColor(SnackbarStyle style, Color? backgroundColor) {
    if (backgroundColor != null) return backgroundColor;
    
    switch (style) {
      case SnackbarStyle.filled:
        return Colors.grey[800];
      case SnackbarStyle.outlined:
        return Colors.transparent;
      case SnackbarStyle.floating:
        return Colors.grey[900];
      case SnackbarStyle.minimal:
        return Colors.grey[100];
    }
  }

  static double _getElevation(SnackbarStyle style) {
    switch (style) {
      case SnackbarStyle.filled:
        return 6;
      case SnackbarStyle.outlined:
        return 0;
      case SnackbarStyle.floating:
        return 8;
      case SnackbarStyle.minimal:
        return 1;
    }
  }

  static EdgeInsets? _getMargin(SnackbarStyle style) {
    switch (style) {
      case SnackbarStyle.filled:
        return null; // No margin for fixed behavior
      case SnackbarStyle.outlined:
        return const EdgeInsets.all(8);
      case SnackbarStyle.floating:
        return const EdgeInsets.all(16);
      case SnackbarStyle.minimal:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  static double _getBorderRadius(SnackbarStyle style) {
    switch (style) {
      case SnackbarStyle.filled:
        return 0;
      case SnackbarStyle.outlined:
        return 8;
      case SnackbarStyle.floating:
        return 12;
      case SnackbarStyle.minimal:
        return 4;
    }
  }

  static SnackBarBehavior _getBehavior(SnackbarStyle style) {
    switch (style) {
      case SnackbarStyle.filled:
        return SnackBarBehavior.fixed;
      case SnackbarStyle.outlined:
        return SnackBarBehavior.floating;
      case SnackbarStyle.floating:
        return SnackBarBehavior.floating;
      case SnackbarStyle.minimal:
        return SnackBarBehavior.floating;
    }
  }
}

class CustomSnackbarContent extends StatelessWidget {
  final String message;
  final Widget? icon;
  final Color? textColor;
  final SnackbarStyle style;

  const CustomSnackbarContent({
    super.key,
    required this.message,
    this.icon,
    this.textColor,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: textColor ?? _getDefaultTextColor(),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Color _getDefaultTextColor() {
    switch (style) {
      case SnackbarStyle.filled:
        return Colors.white;
      case SnackbarStyle.outlined:
        return Colors.grey[800]!;
      case SnackbarStyle.floating:
        return Colors.white;
      case SnackbarStyle.minimal:
        return Colors.grey[800]!;
    }
  }
}

class CustomSnackbarAction extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ActionStyle actionStyle;
  final Color? color;

  const CustomSnackbarAction({
    super.key,
    required this.label,
    required this.onPressed,
    this.actionStyle = ActionStyle.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (actionStyle) {
      case ActionStyle.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: color ?? Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        );
      
      case ActionStyle.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            foregroundColor: Colors.grey[800],
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        );
      
      case ActionStyle.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: color ?? Colors.white,
            side: BorderSide(color: color ?? Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        );
    }
  }
}
