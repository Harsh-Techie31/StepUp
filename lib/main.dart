import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepup/providers/cartProvider.dart';
import 'package:stepup/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        themeMode: ThemeMode.light, // Enforces the dark theme
        theme: ThemeData(
          // Light theme
          fontFamily: "cinzel",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        darkTheme: ThemeData(
          // Dark theme
          brightness: Brightness.dark, // Ensures dark mode is used
          fontFamily: "cinzel",
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
            brightness: Brightness.dark,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white, // Change hint text color to match dark theme
            ),
            prefixIconColor:
                Color.fromRGBO(200, 200, 200, 1), // Lighter color for icons
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white70,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white54,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
