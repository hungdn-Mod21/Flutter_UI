import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_product_water/home.dart';

void main() {
  // SystemChrome : Kiểm soát các khía cạnh cụ thể của giao diện đồ họa của hệ điều hành và cách nó tương tác với ứng dụng
  //
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
