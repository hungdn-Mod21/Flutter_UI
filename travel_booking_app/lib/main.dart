import 'package:flutter/material.dart';
import 'package:travel_booking_app/route/app_route.dart';
import 'package:travel_booking_app/route/app_route_name.dart';
import 'package:travel_booking_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel UI",
      theme: AppTheme.light, // chế độ sáng
      themeMode: ThemeMode.light, // chế độ sáng
      // tuyến đường ban đầu (màn hình ban đầu) của ứng dụng
      initialRoute: AppRouteName.getStarted,
      /* hàm callback được gọi khi cần tạo một tuyến đường mới, nhận vào một đối số RouteSettings và
      trả về một đối tượng Route */
      onGenerateRoute: AppRoute.generate,
    );
  }
}