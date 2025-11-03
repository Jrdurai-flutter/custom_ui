import 'package:custom_ui/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/demo_stack.dart';

class UnderlinedOTPTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const UnderlinedOTPTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Underlined OTP",
      snippet: """
CustomOtpInputField(
  length: 4,
  style: OtpFieldStyle.underlined,

  onCompleted: (otp) => debugPrint('Underlined OTP: '),
),
""",
      onShowCode: onShowCode,
      child: SizedBox(
        child: CustomOtpInputField(
          length: 4,
          style: OtpFieldStyle.underlined,
          onCompleted: (otp) => debugPrint('Underlined OTP: $otp'),
        ),
      ),
    );
  }
}
