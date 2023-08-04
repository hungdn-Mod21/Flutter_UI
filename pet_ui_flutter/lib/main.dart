import 'package:flutter/material.dart';

import 'drawerScreen.dart';
import 'homeScreen.dart';
void main(){
  runApp(MaterialApp(home: const MyApp(),
  theme: ThemeData(
    fontFamily: 'Circular'
  ),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}