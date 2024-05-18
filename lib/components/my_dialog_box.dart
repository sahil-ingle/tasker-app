import 'package:flutter/material.dart';
import 'package:tasker/components/my_button.dart';
import 'package:tasker/components/my_textfield.dart';

class MyDialogBox extends StatelessWidget {

  final TextEditingController mycontroller;
  final Function() onSaveTap;
  final Function() onCancelTap;

  const MyDialogBox({super.key, required this.mycontroller, required this.onSaveTap, required this.onCancelTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyanAccent,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(controller: mycontroller, obscureText: false, hintText: "Enter the task",),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [MyButton(text: "Cancel", onTap: onCancelTap),MyButton(text: "Save", onTap: onSaveTap,)],
              )
            
          ],
        ),
        ),
    );
  }
}