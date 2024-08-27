import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffix;
  final bool pass;
  final void Function(String?) onSaved;
  final String text;
  final TextInputType keyboardType;
  final IconData icon;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.text,
      required this.icon,
      this.pass = false,
      required this.validator,
      required this.onSaved,
      this.keyboardType = TextInputType.text,
      this.suffix = null});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: validator,
      obscureText: pass,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffF7F8F8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffF7F8F8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: const Color(0xffF7F8F8),
          filled: true,
          hintText: text,
          prefixIcon: Icon(icon),
          suffixIcon: suffix),
    );
  }
}
