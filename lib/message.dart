import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Messageing extends StatelessWidget {
  Messageing(
      {super.key,
      required this.msgName,
      required this.checkTask,
      required this.deleteFunction,
      required this.onChanged});
  final String msgName;
  final bool checkTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.deepPurple,
        ),
        height: 65,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: checkTask,
                onChanged: onChanged,
                activeColor: Colors.deepPurple,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 2.0, color: Colors.white),
                ),
              ),
              Text(
                msgName.split(' ').take(5).join(' '),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: checkTask
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 3.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
