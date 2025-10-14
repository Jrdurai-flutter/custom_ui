import 'package:flutter/material.dart';

/// Different toaster types
enum ToasterType {
  success,
  error,
  warning,
  info,
}

/// Toaster position on screen
enum ToasterPosition {
  top,
  bottom,
  center,
}

class CustomToaster {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  /// Show a toaster with customizable options
  static void show({
    required BuildContext context,
    required String message,
    ToasterType type = ToasterType.info,
    ToasterPosition position = ToasterPosition.top,
    Duration duration = const Duration(seconds: 3),
    String? title,
    Widget? icon,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    EdgeInsets? margin,
    EdgeInsets? padding,
    VoidCallback? onTap,
    bool dismissible = true,
  }) {
    if (_isVisible) {
      hide();
    }

    _overlayEntry = _createOverlayEntry(
      message: message,
      type: type,
      position: position,
      title: title,
      icon: icon,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderRadius: borderRadius,
      margin: margin,
      padding: padding,
      onTap: onTap,
      dismissible: dismissible,
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isVisible = true;

    // Auto hide after duration
    Future.delayed(duration, () {
      hide();
    });
  }

  /// Hide the current toaster
  static void hide() {
    if (_isVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }

  static OverlayEntry _createOverlayEntry({
    required String message,
    required ToasterType type,
    required ToasterPosition position,
    String? title,
    Widget? icon,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    EdgeInsets? margin,
    EdgeInsets? padding,
    VoidCallback? onTap,
    bool dismissible = true,
  }) {
    return OverlayEntry(
      builder: (context) => ToasterWidget(
        message: message,
        type: type,
        position: position,
        title: title,
        icon: icon,
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderRadius: borderRadius,
        margin: margin,
        padding: padding,
        onTap: onTap,
        dismissible: dismissible,
      ),
    );
  }
}

class ToasterWidget extends StatefulWidget {
  final String message;
  final ToasterType type;
  final ToasterPosition position;
  final String? title;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool dismissible;

  const ToasterWidget({
    super.key,
    required this.message,
    required this.type,
    required this.position,
    this.title,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.onTap,
    this.dismissible = true,
  });

  @override
  State<ToasterWidget> createState() => _ToasterWidgetState();
}

class _ToasterWidgetState extends State<ToasterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Slide animation based on position
    Offset beginOffset;
    switch (widget.position) {
      case ToasterPosition.top:
        beginOffset = const Offset(0, -1);
        break;
      case ToasterPosition.bottom:
        beginOffset = const Offset(0, 1);
        break;
      case ToasterPosition.center:
        beginOffset = const Offset(0, 0);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    
    switch (widget.type) {
      case ToasterType.success:
        return Colors.green;
      case ToasterType.error:
        return Colors.red;
      case ToasterType.warning:
        return Colors.orange;
      case ToasterType.info:
        return Colors.blue;
    }
  }

  Widget _getIcon() {
    if (widget.icon != null) return widget.icon!;
    
    switch (widget.type) {
      case ToasterType.success:
        return const Icon(Icons.check_circle, color: Colors.white);
      case ToasterType.error:
        return const Icon(Icons.error, color: Colors.white);
      case ToasterType.warning:
        return const Icon(Icons.warning, color: Colors.white);
      case ToasterType.info:
        return const Icon(Icons.info, color: Colors.white);
    }
  }

  Alignment _getAlignment() {
    switch (widget.position) {
      case ToasterPosition.top:
        return Alignment.topCenter;
      case ToasterPosition.bottom:
        return Alignment.bottomCenter;
      case ToasterPosition.center:
        return Alignment.center;
    }
  }

  EdgeInsets _getMargin() {
    if (widget.margin != null) return widget.margin!;
    
    switch (widget.position) {
      case ToasterPosition.top:
        return const EdgeInsets.only(top: 50, left: 16, right: 16);
      case ToasterPosition.bottom:
        return const EdgeInsets.only(bottom: 50, left: 16, right: 16);
      case ToasterPosition.center:
        return const EdgeInsets.symmetric(horizontal: 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: _getAlignment(),
        child: Container(
          margin: _getMargin(),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding: widget.padding ?? 
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getIcon(),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.title != null) ...[
                                Text(
                                  widget.title!,
                                  style: TextStyle(
                                    color: widget.textColor ?? Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                              Text(
                                widget.message,
                                style: TextStyle(
                                  color: widget.textColor ?? Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.dismissible) ...[
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () => CustomToaster.hide(),
                            child: Icon(
                              Icons.close,
                              color: widget.textColor ?? Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
