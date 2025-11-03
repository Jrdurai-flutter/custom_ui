import 'package:custom_ui/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/demo_stack.dart';

class RoundedOTPTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const RoundedOTPTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Rounded OTP",
      snippet: """
CustomOtpInputField(
  length: 4,
  style: OtpFieldStyle.outlined,
  borderRadius: BorderRadius.circular(12),
  onCompleted: (otp) => debugPrint('Rounded OTP: '),
),
""",
      onShowCode: onShowCode,
      child: SizedBox(
        child: CustomOtpInputField(
          length: 4,
          style: OtpFieldStyle.outlined,
          borderRadius: 34,
          onCompleted: (otp) => debugPrint('Rounded OTP: $otp'),
        ),
      ),
    );
  }
}
