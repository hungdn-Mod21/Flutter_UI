import 'package:flutter/material.dart';
import 'package:travel_booking_app/route/app_route_name.dart';
import 'package:travel_booking_app/screens/detail_destination_screen.dart';
import 'package:travel_booking_app/screens/get_started_screen.dart';
import 'package:travel_booking_app/screens/home_screen/home_screen.dart';

class AppRoute {
  // Func quản lý route của App
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.getStarted:
        return MaterialPageRoute(
          // Màn hình trả về
          builder: (_) => const GetStartedScreen(),
          settings: settings,
        );

      case AppRouteName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.detailDestination:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailDestinationScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }

    return null;
  }
}