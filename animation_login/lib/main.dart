import 'package:animation_login/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // App chỉ chạy vs màn hình Web
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Màu nền
        scaffoldBackgroundColor: Color(0xffE9EFF3),
        // Theme for Input TextField
        inputDecorationTheme: InputDecorationTheme(
          filled: true, // cho phép chỉnh sửa thuộc tính
          fillColor: Colors.white, // màu nền TextField
          hoverColor: Colors.white, // màu khi hover
          border: InputBorder.none, // Hình dạng của đường viền
          enabledBorder: InputBorder.none, // Hiển thị đường viền khi bật
          focusedBorder: InputBorder.none, // Hiển thị đường viền khi trỏ vào
        ),
      ),
      home: const SignUpPage(),
    );
  }
}
