import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  
  const MyTextField({super.key, required this.controller, required this.obscureText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
      
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

      
        ),
      ),
    );
  }
}