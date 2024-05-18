import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),

        decoration: BoxDecoration(
          color: Color.fromARGB(255, 46, 206, 255),
          borderRadius: BorderRadius.circular(10),
          ),
          
          
          child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(text, style: const TextStyle(fontSize: 15),),
        )),
        
      ),
    );
  }
}