import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasker/components/my_dialog_box.dart';
import 'package:tasker/components/my_task.dart';
import 'package:tasker/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box("myBox");
  database db = database();


  @override
  void initState() {

    if(_myBox.get("tasksData") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    
    super.initState();
  }

  

  final taskText = TextEditingController();

  void logout(){}


  void tickToggle(bool? value, int index){
    setState(() {
      db.tasks[index][1] = value;
    });
    db.updateDatabase();
  }


  void saveBtnClick(){
    setState(() {
      db.tasks.add([taskText.text,false]);
    });
    Navigator.of(context).pop();
    taskText.clear();
    db.updateDatabase();
  }

  void cancelBtnClick(){
    Navigator.of(context).pop();
    taskText.clear();
  }

  void addNewTask(){
    showDialog(context: context, builder: (context){
      return MyDialogBox(mycontroller: taskText,onSaveTap: saveBtnClick,onCancelTap: cancelBtnClick,);
    });
  }

  void deleteTask(int index){
    setState(() {
      db.tasks.remove(db.tasks[index]);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasker"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        //actions: [IconButton(onPressed: logout, icon: const Icon(Icons.logout))],
      ),

      floatingActionButton: FloatingActionButton(onPressed: addNewTask,child: const Icon(Icons.add),),

      body: ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder: (context, index){
          return MyTask(text: db.tasks[index][0],
          cheboxValue: db.tasks[index][1],
           onChanged: (value) => tickToggle(value, index), 
           deletePress: () => deleteTask(index),);
        }
        )
    );
  }
}