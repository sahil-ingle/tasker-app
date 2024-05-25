import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasker/components/my_button.dart';
import 'package:tasker/components/my_textfield.dart';
import 'package:tasker/pages/home_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final TextEditingController _nameController = TextEditingController();

  final _myBox = Hive.box("myBox");
  

  void onTap(BuildContext context){

    if (_nameController.text != ""){
      _myBox.put("name", _nameController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage() ,maintainState: false));

    }else{
      Fluttertoast.showToast(msg: "Enter your name");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(controller: _nameController, obscureText: false, hintText: "Enter Your name"),
          const SizedBox(height: 30,),
          MyButton(text: "Submit", onTap: () => onTap(context)),
        ],
      ),
    );
  }
}