import 'package:flutter/material.dart';
import 'package:vorkinsta/screens/home_page.dart';
import 'package:vorkinsta/values/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xff0d3451),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColors.blue)),
      home: const HomePage(),
    );
  }
}
