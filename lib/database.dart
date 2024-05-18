import 'package:hive/hive.dart';

class database{
  List tasks = [];
  final _myBox = Hive.box("myBox");

  void createInitialData(){
    tasks = [
      ["Flutter-App", true],["Exercise", false]
    ];
  }

  void loadData(){
    tasks =_myBox.get("tasksData");
  }

  void updateDatabase(){
    _myBox.put("tasksData", tasks);
  }

}