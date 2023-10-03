import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List studingList = [];
  List workList = [];
  List soprtList = [];
  List personalList = [];
  List shoppingList = [];
  List othersList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    studingList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    workList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    soprtList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    personalList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    shoppingList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
    othersList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    soprtList = _myBox.get("SPORTLIST");
    workList = _myBox.get("WORKLIST");
    shoppingList = _myBox.get("SHOPPINGLIST");
    othersList = _myBox.get("OTHERSLIST");
    studingList = _myBox.get("STUDINGLIST");
    personalList = _myBox.get("PERSONALLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("SPORTLIST", soprtList);
    _myBox.put("WORKLIST", workList);
    _myBox.put("SHOPPINGLIST", shoppingList);
    _myBox.put("OTHERSLIST", othersList);
    _myBox.put("STUDINGLIST", studingList);
    _myBox.put("PERSONALLIST", personalList);
  }
}
