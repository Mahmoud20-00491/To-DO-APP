import 'package:flutter/material.dart';
import 'package:non_app/pages/others.dart';
import 'package:non_app/pages/personal.dart';
import 'package:non_app/pages/shopping.dart';
import 'package:non_app/pages/sport.dart';
import 'package:non_app/pages/studing.dart';
import 'package:non_app/pages/work.dart';

class LabelsPage extends StatefulWidget {
  const LabelsPage({Key? key}) : super(key: key);

  @override
  State<LabelsPage> createState() => _LabelsPageState();
}

class _LabelsPageState extends State<LabelsPage> {
  List labelsName = [
    {'labelName': "Studying", "labelImg": "lib/images/studing.png"},
    {'labelName': "Work", "labelImg": "lib/images/working.png"},
    {'labelName': "Sport", "labelImg": "lib/images/sports.png"},
    {'labelName': "Personal", "labelImg": "lib/images/man.png"},
    {'labelName': "Shopping", "labelImg": "lib/images/shopping.png"},
    {'labelName': "Others", "labelImg": "lib/images/other.png"}
  ];

  void navigateToPage(String pageName) {
    switch (pageName) {
      case "Studying":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudingPage()),
        );
        break;
      case "Work":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WorkPage()),
        );
        break;
      case "Sport":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SportPage()),
        );
        break;
      case "Personal":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalPage()),
        );
        break;
      case "Shopping":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoppingPage()),
        );
        break;
      case "Others":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OthersPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'lib/images/check.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tango',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: labelsName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: GestureDetector(
                          onTap: () {
                            navigateToPage(labelsName[index]["labelName"]!);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    labelsName[index]["labelImg"]!,
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    labelsName[index]["labelName"]!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
