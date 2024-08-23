import 'package:flutter/material.dart';
import 'package:stepup/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StepUp-N0VA",
      theme: ThemeData(
        fontFamily: "cinzel",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ))
      ,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
