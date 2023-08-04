import 'package:flutter/material.dart';
import 'package:flutter_travel_app/views/pages/home_page.dart';
import 'package:flutter_travel_app/views/widgets/custom_bottom_nav.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: PageView(
          children: [
            HomePage(),
          ],
        )),
        Align(alignment: Alignment.bottomCenter, child: CustomNavbar())
      ],
    );
  }
}