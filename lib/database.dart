import 'package:hive/hive.dart';

class database{
  List tasks = [];
  String name = "";
  final _myBox = Hive.box("myBox");

  void createInitialData(){
    tasks = [
      ["Flutter-App", true],["Exercise", false]
    ];
    name = _myBox.get("name");
  }

  void loadData(){
    tasks =_myBox.get("tasksData");
    name = _myBox.get("name");
  }
  

  void updateDatabase(){
    _myBox.put("tasksData", tasks);
  }

}