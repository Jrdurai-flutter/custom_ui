import 'package:flutter/material.dart';

/// Define breakpoints
enum DeviceType { mobile, tablet, laptop, desktop }

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.desktop,
  });

  static DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) return DeviceType.mobile;
    if (width < 1024) return DeviceType.tablet;
    if (width < 1440) return DeviceType.laptop;
    return DeviceType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.laptop:
        return laptop;
      case DeviceType.desktop:
        return desktop;
    }
  }
}
