import 'package:flutter/material.dart';

class TFiled extends StatelessWidget {
  const TFiled(
      {super.key,
      required this.tName,
      required this.obscureText,
      required this.controller});
  final String tName;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: tName,
          hintStyle:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.grey[300],
          filled: true),
    );
  }
}
