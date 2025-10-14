import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';
import 'package:custom_ui/custom_ui.dart';


class ResponsivePage extends StatelessWidget {


  final void Function(String) onShowCode;
  const ResponsivePage({super.key, required this.onShowCode});


  @override
  Widget build(BuildContext context) {
    return DemoStack(
        child: ResponsiveLayout(
          mobile: Container(
            color: Colors.green,
            child: const Center(child: Text("📱 Mobile View", style: TextStyle(fontSize: 24))),
          ),
          tablet: Container(
            color: Colors.orange,
            child: const Center(child: Text("📲 Tablet View", style: TextStyle(fontSize: 24))),
          ),
          laptop: Container(
            color: Colors.blue,
            child: const Center(child: Text("💻 Laptop View", style: TextStyle(fontSize: 24))),
          ),
          desktop: Container(
            color: Colors.purple,
            child: const Center(child: Text("🖥️ Desktop View", style: TextStyle(fontSize: 24))),
          ),
        ), snippet:  """
ResponsiveLayout(
  mobile: MobileLayout(),
  tablet: TabletLayout(),
  laptop: LaptopLayout(),
  desktop:DistopLayout());
  
  //// Also you can find Layouttype below Example
  @override
Widget build(BuildContext context) {
  final deviceType = ResponsiveLayout.getDeviceType(context);

  if (deviceType == DeviceType.mobile) {
    return const Text("📱 Mobile view only");
  } else if (deviceType == DeviceType.tablet) {
    return const Text("📲 Tablet view only");
  } else if (deviceType == DeviceType.laptop) {
    return const Text("💻 Laptop view only");
  } else {
    return const Text("🖥️ Desktop view only");
  }
}


""", onShowCode: onShowCode);
  }
}
