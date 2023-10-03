import 'package:flutter/material.dart';
import 'package:non_app/textFiled.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox(
      {Key? key,
      required this.onSave,
      required this.onCancel,
      required this.controller})
      : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          children: [
            TFiled(
                tName: 'To Do ',
                obscureText: false,
                controller: widget.controller),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: widget.onSave,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onCancel,
                  child: const Text('Cancel',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
