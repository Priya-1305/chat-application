import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final bool obscureText;
  final FocusNode? focusNode;

  const MyTextfield({
    super.key,
    required this.hinttext,
    required this.obscureText,
    required this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ), // Remove extra padding
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        style: TextStyle(color: colorScheme.tertiary),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(
              color: colorScheme.tertiary, // Soft border
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
          ),
          fillColor: colorScheme.secondary,
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.deepPurple.shade200,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
