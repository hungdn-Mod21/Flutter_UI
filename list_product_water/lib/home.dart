import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:list_product_water/data.dart';
import 'package:list_product_water/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // -------------------------- APPBAR -----------------------------
              Padding(
                // kiểu lề LTRB
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Row(
                  children: [
                    // Drawer
                    Image.asset(
                      "images/menuicon.png",
                      height: 25,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    // Search
                    FaIcon(FontAwesomeIcons.search),
                    SizedBox(
                      width: 25,
                    ),
                    // Bag
                    Image.asset(
                      'images/shopping-bag-outline.png',
                      height: 25,
                    ),
                  ],
                ),
              ),
              // --------------------- Trending --------------------------------
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                    Text(
                      'See All',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
              ),
              //--------------------------- Contents ---------------------------
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                  // List products
                  child: GridView.builder(
                      // chỉnh lưới
                      // SliverGridDelegateWithFixedCrossAxisCount :Đại biểu lưới cúi với số lượng trục chéo cố định Đại biểu lưới cúi với số lượng trục chéo cố định
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // cột/hàng
                        mainAxisSpacing: 20, // k/cách hàng
                        crossAxisSpacing: 70, // k/cách cột
                        childAspectRatio: 0.75, // tỷ lệ khung hình
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Item(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ------------------- Images --------------------
                              Expanded(
                                child: Container(
                                  width: double.maxFinite, // độ rộng hữu hạn
                                  decoration: BoxDecoration(
                                    color:
                                        Color(data[index]['color']), // màu nền
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    // Chèn img
                                    child: Stack(
                                      children: [
                                        // Hình tròn
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        // Độ mờ cho hình tròn
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor:
                                                Color(data[index]['color'])
                                                    .withOpacity(0.5),
                                          ),
                                        ),
                                        // Img products
                                        Image.network(
                                          data[index]['image'],
                                          height: 160,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // --------------- Name and price ----------------
                              Text(data[index]['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                r'$' + data[index]['price'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
