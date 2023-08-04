import 'package:flutter/material.dart';
import 'package:shoes_shop/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // kiểu chữ
        fontFamily: 'Averta',
      ),
      home: const HomePage(),
    );
  }
}
