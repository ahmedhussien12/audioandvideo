import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppOtp extends StatelessWidget {
  const AppOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.phone,
      backgroundColor: Colors.transparent,
      cursorColor: Theme.of(context).primaryColor,
      //enableActiveFill: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldHeight: 60,
          fieldWidth: 70,
          selectedColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).primaryColor.withOpacity(.67),
          activeColor: Theme.of(context).primaryColor),
    );
  }
}
