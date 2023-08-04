// pub chuyển động 
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/pages/home_page.dart';
import 'package:shoes_shop/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 5,  // đổ bóng
        // Icon back
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(
            Icons.close,
            color: black,
          ),
        ),
      ),
      body: GetBody(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget GetBody() {
    List itemMenus = ["Home", "New in", "Sale", "Profile", "Log out"];

    return ListView(
      children: [
        const SizedBox(height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(itemMenus.length, (index) {
            return GestureDetector(
              onTap: (() {
                // 'pushAndRemoveUntil' chuyển sang màn mới và xóa tất cả các màn trước đó ra khỏi ngăn xếp
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                    (route) => false);
              }),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                // ElasticIn(Chuyển động đàn hồi) của pub 'animate_do' để cho các itemMenus khi mở ra sẽ chuyển động dung
                child: ElasticIn(    
                  duration: Duration(milliseconds: 1000 * index), // thời gian chuyển động mỗi itemMenus
                  child: Text(
                    itemMenus[index],
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}