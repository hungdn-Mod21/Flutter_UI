import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/theme/colors.dart';
import 'package:shoes_shop/widgets/product_slider.dart';

class ProductDetailPage extends StatefulWidget {
  // thuộc tính
  final String id;
  final String name;
  final String img;
  final String price;
  final List mulImg;
  final List sizes;

  // contructor
  const ProductDetailPage(
      {super.key, required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.mulImg,
      required this.sizes});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // vị trí Size giày đang được chọn
  int activeSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget GetBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                // đổ bóng
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2, // mờ bán kính
                    color: Colors.black.withOpacity(0.1), // withOpacity(độ mờ)
                    spreadRadius: 3, // bán kính lan
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  // ------- ProductSlider (Slider sản phẩm) 
                  ProductSlider(
                    items: widget.mulImg,
                  ),
                  // Nút back
                  SafeArea( /* SafeArea : bao bọc các widget con bên trong nó và đảm bảo rằng chúng không 
                  bị chạm vào các vùng an toàn như phần đỉnh và đáy của màn hình, phần hiển thị thời gian 
                  và tín hiệu sóng, hoặc các phần khác có thể che phủ nội dung */
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          // -- Logo
          FadeInDown(
            duration: const Duration(milliseconds: 450),
            child: Image.asset(
              "assets/images/nike_logo.png",
              fit: BoxFit.cover,
              width: 70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // -- Tên product
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                // lề chữ
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // -- Giá product
          FadeInDown(
            duration: const Duration(milliseconds: 550),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "\$ ${widget.price}",
                style: const TextStyle(
                  fontSize: 30,
                ),
                // lề chữ
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // -- Text Sizes Guide
          FadeInDown(
            duration: const Duration(milliseconds: 600),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sizes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Size Guide",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // -------- chọn Size giày
          FadeInDown(
            duration: const Duration(milliseconds: 650),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // hướng Scroll
                child: Row(
                  // Danh sách size
                  children: List.generate(
                    widget.sizes.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          // Thay đổi trạng thái vị trí size
                          setState(() {
                            activeSize = index;
                          });
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 15, top: 5, bottom: 5),
                          child: Container(
                            width: 70, 
                            height: 70,
                            decoration: BoxDecoration(
                              // Chuyển màu nền khi chọn size
                              color: activeSize == index ? black : grey,
                              borderRadius: BorderRadius.circular(10),
                              // đổ bóng
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1, // bán kính lan
                                  blurRadius: 0.5, // mờ bán kính
                                  color: Colors.black
                                      .withOpacity(0.1), // withOpacity(độ mờ)
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                widget.sizes[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  // Chuyển màu chữ khi chọn size
                                  color: activeSize == index ? white : black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ----- Like , Add to Cart
          FadeInDown(
            duration: const Duration(milliseconds: 650),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                children: [
                  // Icon heart
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                      // đổ bóng
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1, // bán kính lan
                          blurRadius: 0.5, // mờ bán kính
                          color:
                              Colors.black.withOpacity(0.1), // withOpacity(độ mờ)
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/heart_icon.svg"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
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
                            "ADD TO CART",
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}