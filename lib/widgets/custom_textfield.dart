import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.isPasswordField,
      this.text,
      this.focusNode,
      this.onChanged,
      this.onSubmitted});
  final String text;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final bool isPasswordField;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(10)),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        obscureText: isPasswordField ?? false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24)),
      ),
    );
  }
}
