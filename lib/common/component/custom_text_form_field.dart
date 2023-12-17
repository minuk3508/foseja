import 'package:flutter/material.dart';
import 'package:foseja/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 153, 153, 153),
        width: 2,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autoFocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 12,
        ),
        filled: true,
        fillColor: INPUT_BG_COLOR,
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
          color: PRIMARY_COLOR,
        )),
      ),
    );
  }
}
