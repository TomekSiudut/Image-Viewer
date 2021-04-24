import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:images/screens/nav_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Images Viewer',
        theme: ThemeData(),
        home: NavScreen());
  }
}
