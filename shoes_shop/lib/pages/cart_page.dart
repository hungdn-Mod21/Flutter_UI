// pub chuyển động 
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/database/product_data.dart';
import 'package:shoes_shop/theme/colors.dart';
import 'package:shoes_shop/widgets/get_title_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // tổng tiền giỏ hàng
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar( 
        backgroundColor: white,
        elevation: 1, // đổ bóng
        title: GetTitleAppBar(context),
      ),
      body: GetBody(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget GetBody() {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 25),
          child: Text(
            "My Bag",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          // Danh sách sản phẩm trong giỏ hàng
          children: List.generate(
            3,
            (index) {
              // tính tổng tiền
              total += double.parse(products[index]['price']);
              return Padding(
                padding:
                    const EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 20),
                // FadeInDown (hiện dần xuống, content được hiện dần xuống) của pub 'animate_do'
                child: FadeInDown(
                  duration: Duration(milliseconds: 450 * index),  // thời gian hiện mỗi products
                  child: Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 20) / 2,
                        height: 130,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30),
                          // đổ bóng
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3, // bán kính lan
                              blurRadius: 1, // mờ bán kính
                              color: black.withOpacity(0.1), //withOpacity(độ mờ)
                            )
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "assets/images/" + products[index]['img']),
                              fit: BoxFit.contain), // thu nhỏ lại vừa kích thớc
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index]['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "\$ " + products[index]['price'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "x1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Thông tin tổng đơn hàng
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 25, left: 25, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "\$ $total",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        // Nút Checkout
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 25),
          child: TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
        ),
      ],
    );
  }
}