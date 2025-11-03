import 'package:custom_ui/custom_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:example/widgets/demo_stack.dart';

class BoxedOTPTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const BoxedOTPTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Boxed OTP",
      snippet: """
CustomOtpInputField(
  length: 6,
  style: OtpFieldStyle.box,
  boxBorderColor: Colors.teal,
  onCompleted: (otp) => debugPrint('Boxed OTP: '),
),
""",
      onShowCode: onShowCode,
      child: SizedBox(
        child: CustomOtpInputField(
          length: 6,
          style: OtpFieldStyle.box,
          onCompleted: (otp) => debugPrint('Boxed OTP: $otp'),
        ),
      ),
    );
  }
}
