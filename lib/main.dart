import 'package:animated_splash_screen/animated_splash_screen.dart';
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splash: 'lib/images/check.png',
            splashIconSize: 100,
            backgroundColor: Colors.grey[200]!,
            nextScreen: LabelsPage(),
            splashTransition: SplashTransition.fadeTransition));
  }
}
