import 'package:flutter/material.dart';

class MyTask extends StatelessWidget {
  final String text;
  final void Function(bool?) onChanged;
  final bool cheboxValue;
  final void Function() deletePress;
  const MyTask({super.key,required this.text,required this.cheboxValue, required this.onChanged, required this.deletePress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        children: [
          Checkbox(value: cheboxValue, onChanged: onChanged),
          Expanded(child: Text(text,style: TextStyle(color: Colors.black,fontSize: 20,decoration: cheboxValue ? TextDecoration.lineThrough : TextDecoration.none),)),
          IconButton(onPressed: deletePress, icon: const Icon(Icons.delete,size: 25,))
          ]
        ),
    );
  }
}