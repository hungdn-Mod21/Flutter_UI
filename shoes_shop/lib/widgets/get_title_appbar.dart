import 'package:flutter/material.dart';
// Pub dùng ảnh .svg
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/pages/cart_page.dart';
import 'package:shoes_shop/pages/menu_page.dart';

// ignore: non_constant_identifier_names
Widget GetTitleAppBar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // ------- Icon go MenuPage
      IconButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MenuPage(),
              fullscreenDialog: true,     // fullscreenDialog (hộp thoại toàn màn hình)
            ),
          );
        }),
        // Ảnh .svg SvgPicture dùng pub 'flutter_svg'
        icon: SvgPicture.asset("assets/images/burger_icon.svg"),
      ),
      Row(
        children: [
          IconButton(
            onPressed: (() {}),
            icon: SvgPicture.asset("assets/images/search_icon.svg"),
          ),
          IconButton(
            onPressed: (() {}),
            icon: SvgPicture.asset("assets/images/filter_icon.svg"),
          ),
          // ------- Icon go CartPage
          IconButton(
            onPressed: (() {
              // 'pushReplacement' chuyển xang màn mới và xóa màn hiện tại khỏi ngăn xếp
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            }),
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // hộp kiểu hình tròn
                color: Colors.black,
              ),
              child: const Center(
                child: Text(
                  "3",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}