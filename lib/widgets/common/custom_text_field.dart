import 'package:flutter/material.dart';

class FCustomTextField extends StatelessWidget {
  final TextEditingController editingController;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final Color? boxColor;
  final Color? borderSideColor;
  final double? borderRadius;
  final TextStyle? textStyle;

  const FCustomTextField({
    super.key,
    required this.editingController,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.boxColor,
    this.borderSideColor,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: boxColor ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      child: TextField(
        controller: editingController,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: textStyle ?? const TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 30.0),
            ),
            borderSide: BorderSide(color: borderSideColor ?? Colors.blue),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
