import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:non_app/lables.dart';

import 'pages/sport.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LabelsPage());
  }
}
