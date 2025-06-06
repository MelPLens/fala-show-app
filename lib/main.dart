import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FalaShowApp());
}

class FalaShowApp extends StatelessWidget {
  const FalaShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FalaShow',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
