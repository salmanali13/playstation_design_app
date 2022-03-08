import 'package:flutter/material.dart';
import 'package:playstation_design_app/Screens/HomeScreen.dart';
import 'package:playstation_design_app/Screens/ProductDetailScreen.dart';
import 'package:playstation_design_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playstation Design App',
      theme: AppTheme.lightTheme(),
      home: const HomeScreen(),
      routes: {
        "home-screen/route": (context) => const HomeScreen(),
        "Product-Detail-Screen/route": (context) => const ProductDetailScreen(),
      },
    );
  }
}
