import 'package:flutter/material.dart';

/// Different button styles supported
enum ButtonType {
  elevated,
  text,
  outlined,
  rounded,
  circular,
  gradient,
  filledIcon,
  outlinedIcon,
}

/// Icon placement
enum IconPosition { prefix, suffix }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final Color? color; // nullable
  final double radius;
  final Gradient? gradient;
  final EdgeInsets padding;
  final Widget? icon;
  final IconPosition iconPosition;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.elevated,
    this.color, // no default, so app theme takes over
    this.radius = 12,
    this.gradient,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.icon,
    this.iconPosition = IconPosition.prefix,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    // fallback to app theme if color not passed
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    switch (type) {
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: effectiveColor,
            padding: padding,
          ),
          child: _buildChild(textColor: effectiveColor),
        );

      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: effectiveColor,
            side: BorderSide(color: effectiveColor),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: _buildChild(textColor: effectiveColor),
        );

      case ButtonType.rounded:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: padding,
          ),
          child: _buildChild(textColor: Colors.white),
        );

      case ButtonType.circular:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveColor,
            elevation: elevation,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: icon ?? const Icon(Icons.circle, color: Colors.white),
        );

      case ButtonType.gradient:
        return Container(
          decoration: BoxDecoration(
            gradient: gradient ??
                LinearGradient(colors: [
                  effectiveColor,
                  effectiveColor.withOpacity(0.7),
                ]),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: elevation > 0
                ? [
              BoxShadow(
                color: Colors.black26,
                blurRadius: elevation * 3,
                offset: Offset(0, elevation),
              )
            ]
                : null,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              padding: padding,
            ),
            onPressed: onPressed,
            child: _buildChild(textColor: Colors.white),
          ),
        );

      case ButtonType.filledIcon:
        return ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: padding,
          ),
          icon: icon ?? const Icon(Icons.star, color: Colors.white),
          label: Text(text, style: const TextStyle(color: Colors.white)),
        );

      case ButtonType.outlinedIcon:
        return OutlinedButton.icon(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: effectiveColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: padding,
          ),
          icon: icon ?? Icon(Icons.star, color: effectiveColor),
          label: Text(text, style: TextStyle(color: effectiveColor)),
        );

      case ButtonType.elevated:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: padding,
          ),
          onPressed: onPressed,
          child: _buildChild(textColor: Colors.white),
        );
    }
  }

  /// Handles prefix/suffix icon with text
  Widget _buildChild({Color textColor = Colors.black}) {
    if (icon == null) {
      return Text(text, style: TextStyle(color: textColor));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconPosition == IconPosition.prefix) ...[
          icon!,
          const SizedBox(width: 8),
        ],
        Text(text, style: TextStyle(color: textColor)),
        if (iconPosition == IconPosition.suffix) ...[
          const SizedBox(width: 8),
          icon!,
        ],
      ],
    );
  }
}

