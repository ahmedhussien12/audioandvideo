import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final bool isPassword;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const AppInput(
      {super.key,
      required this.label,
      this.keyboardType,
      this.isPassword = false,
      this.maxLines = 1,
      this.hint,
      this.controller, this.validator});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: isHidden && widget.isPassword,
      obscuringCharacter: "*",
      maxLines: widget.maxLines,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        alignLabelWithHint: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
              )
            : null,
      ),
    );
  }
}
