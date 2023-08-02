import 'package:animal_biography_firedatabase/pages/Animal_info_page.dart';
import 'package:animal_biography_firedatabase/pages/Homepage.dart';
import 'package:animal_biography_firedatabase/pages/splash_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "splash",
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Homepage(),
        "splash":(context) => SplashScreen(),
        "animated":(context) => AnimalData(),
      },
    );
  }
}
