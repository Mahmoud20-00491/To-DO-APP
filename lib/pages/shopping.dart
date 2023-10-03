import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:non_app/database.dart';
import 'package:non_app/dialog.dart';
import 'package:non_app/message.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({
    Key? key,
  }) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("SHOPPINGLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.shoppingList[index][1] = !db.shoppingList[index][1];
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.shoppingList.removeAt(index);
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.shoppingList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void editMessage(BuildContext context, int index) {
    final TextEditingController _controller =
        TextEditingController(text: db.shoppingList[index][0]);

    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: onCancel,
          onSave: () {
            if (_controller.text != db.shoppingList[index][0]) {
              setState(() {
                db.shoppingList[index][0] = _controller.text;
                db.shoppingList[index][1] = false;
                _controller.clear();
              });

              db.updateDataBase();
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, // Set the color of the back arrow to black
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/shopping.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Shopping Tasks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                // Add an Expanded widget here
                child: ListView.builder(
                  itemCount: db.shoppingList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.5,
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => editMessage(context, index),
                            icon: Icons.edit,
                            backgroundColor: Colors.blueGrey,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                          ),
                          SlidableAction(
                            onPressed: (context) => deleteTask(index),
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                          )
                        ],
                      ),
                      child: Messageing(
                        msgName: db.shoppingList[index][0],
                        checkTask: db.shoppingList[index][1],
                        deleteFunction: (context) => deleteTask(index),
                        onChanged: (value) => checkBoxChanged(value, index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
