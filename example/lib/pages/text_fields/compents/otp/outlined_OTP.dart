
import 'package:custom_ui/custom_otp_text_field.dart';
import 'package:flutter/material.dart';


import 'package:example/widgets/demo_stack.dart';


class OutlinedOTPTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedOTPTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Outlined OTP",
      snippet: """
 CustomOtpInputField(
              length: 4,
              style: OtpFieldStyle.outlined,
              onCompleted: (otp) => debugPrint('Outlined OTP: '),
            ),
""",
      onShowCode: onShowCode,
      child:  SizedBox(
        child: CustomOtpInputField(
          length: 4,
          style: OtpFieldStyle.outlined,
          onCompleted: (otp) => debugPrint('Outlined OTP: $otp'),
        ),
      ),
    );
  }
}