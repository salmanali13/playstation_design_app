import 'package:flutter/material.dart';

class AppTheme {
  // Theme for the light color scheme--------
  static ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: const Color.fromRGBO(
          225, 235, 243, 1), // Background color of the scaffold
      iconTheme: const IconThemeData(
        color:
            Color.fromARGB(255, 165, 173, 184), // Color of the icons in the app
      ),
      cardColor: const Color.fromRGBO(234, 241, 250, 1),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromRGBO(50, 208, 231, 1),
          elevation: 10),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0), // Color of the AppBar
    );
  }

  // Color.fromRGBO(234, 241, 250, 1)

  // Theme for the dark color scheme--------
  static ThemeData darkThem() {
    return ThemeData(
        backgroundColor: const Color.fromRGBO(38, 45, 60, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(114, 142, 178, 1),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromRGBO(50, 208, 231, 1),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0));
  }

  static final shadow = [
    const BoxShadow(
      color: Color.fromARGB(40, 0, 0, 0),
      blurRadius: 10,
      offset: Offset(5, 4),
      spreadRadius: 1,
    ),
    const BoxShadow(
      color: Color.fromARGB(139, 255, 255, 255),
      blurRadius: 0,
      offset: Offset(-1, -1),
      spreadRadius: 1,
    )
  ];
}
