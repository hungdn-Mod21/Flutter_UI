import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/database/product_data.dart';
import 'package:shoes_shop/pages/product_detail.dart';
import 'package:shoes_shop/theme/colors.dart';
import 'package:shoes_shop/widgets/get_title_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3, // đổ bóng
        title: GetTitleAppBar(context),
      ),
      body: GetBody(),
    );
  }

  // ------------------------------- BODY -------------------------------
  // ignore: non_constant_identifier_names
  Widget GetBody() {
    return ListView(
      children: [
        // -------- Title , Sort by ---------
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shoes",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    "Sort by",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ],
          ),
        ),
        // ---------- Product ----------
        Column(
          children: List.generate(products.length, (index) {
            return GestureDetector(
              onTap: () {
                // Chuyển sang màn ProductDetailPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProductDetailPage(
                          id: products[index]['id'].toString(),
                          name: products[index]['name'],
                          img: products[index]['img'],
                          price: products[index]['price'],
                          mulImg: products[index]['mul_img'],
                          sizes: products[index]['sizes'],
                        )),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    // ---------- Ảnh , Name , Price của Product ------------
                    FadeInDown(    // FadeInDown (hiện dần xuống, content được hiện dần xuống) của pub 'animate_do'
                      duration: Duration(milliseconds: 400 * index),  // thời gian chờ 
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                          // đổ bóng
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5, // bán kính lan
                              color:
                                  black.withOpacity(0.2), //withOpacity(độ mờ)
                              blurRadius: 2, // mờ bán kính
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            // ----- image -----
                            Center(
                              child: Container(
                                width: 280,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    image: AssetImage("assets/images/" +
                                        products[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // ----- name product -----
                            Text(
                              products[index]['name'],
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            // ----- price product -----
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "\$ " + products[index]['price'],
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    // ----- icon heart -----
                    Positioned(
                      right: 10,
                      child: IconButton(
                        onPressed: (() {}),
                        // SvgPicture(cho phép dùng ảnh .svg) của pub 'flutter_svg'
                        icon: SvgPicture.asset(
                          "assets/images/heart_icon.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}