import 'package:custom_ui/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/demo_stack.dart';

class FilledOTPTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FilledOTPTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Filled OTP",
      snippet: """
CustomOtpInputField(
  length: 4,
  style: OtpFieldStyle.filled,
  fillColor: Colors.blue.shade50,
  onCompleted: (otp) => debugPrint('Filled OTP: '),
),
""",
      onShowCode: onShowCode,
      child: SizedBox(
        child: CustomOtpInputField(
          length: 4,
          style: OtpFieldStyle.filled,
          fillColor: Colors.blue.shade50,
          onCompleted: (otp) => debugPrint('Filled OTP: $otp'),
        ),
      ),
    );
  }
}
