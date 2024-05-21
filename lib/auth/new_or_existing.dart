import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasker/pages/first_page.dart';
import 'package:tasker/pages/home_page.dart';

class NewOrExisting extends StatelessWidget {
  NewOrExisting({super.key});

  final _myBox = Hive.box("myBox");

  @override
  Widget build(BuildContext context) {
    if(_myBox.get("name") == null){
      return FirstPage();
    }else{
      return HomePage();
    }
  }
}