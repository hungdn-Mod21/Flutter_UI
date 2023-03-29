import 'package:flutter/material.dart';
import 'package:list_product_water/data.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------- IMAGE MAIN ------------------------
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.9, 
                  decoration: BoxDecoration(
                    color: Color(0xffbccaca),
                    borderRadius: BorderRadius.only(
                      // bo viền 1 góc
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      // ------- IMAGE
                      Expanded(
                        child: Container(
                          child: Center(
                            // xếp chèn
                            child: Stack(
                              children: [
                                // Hình tròn
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                // màu nền hình tròn
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor:
                                        Color(0xffbccaca).withOpacity(0.5),
                                  ),
                                ),
                                // ảnh products
                                Image.network(
                                  'https://cdn.accentuate.io/31823129542702/11366956630062/StoJo_200206_Product-68488-v1584383135067.png?936x1160',
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 6, // tỷ lệ 6 phần
                      ),
                      // -------------- CHOSES COLORS and FAVORITE -------------
                      Expanded(
                        flex: 1, // tỷ lệ 1 phần
                        child: Container(
                          color: Color(0xff9db1b1), // màu nền
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ------- Img BAG
                                Image.asset(
                                  'images/shopping-bag-outline.png',
                                  color: Colors.white,
                                  height: 35,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // ------- Chọn màu
                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      scrollDirection:
                                          Axis.vertical, // xếp theo chiều dọc
                                      itemBuilder: (context, index) {
                                        return index ==
                                                2 // nếu ở vị trí index = 2
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor:
                                                      Colors.white, // màu viền
                                                  child: CircleAvatar(
                                                    radius: 2,
                                                    backgroundColor: Color(
                                                        data[index]['color']),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Color(
                                                      data[index]['color']),
                                                ),
                                              );
                                      }),
                                ),
                                // -------- Icon favorite
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ---------------------- Button Back --------------------------
                Positioned(
                    top: 30,
                    left: 10,
                    child: InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // ---------------------------- List Contents ----------------------
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stojo Coffee Cup',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Dishwasher safe',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'No phthalates, leads or glues',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BPA-free, polypropylene lid and  heat sleeve',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            // ----------------------- List Size -------------------------------
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              height: 90,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(
                            (index + 1) * 7.0), // chỉnh kích cỡ item list
                        width: 130,
                        child: Image.network(
                          'https://cdn.accentuate.io/31823129542702/11366956630062/StoJo_200206_Product-68488-v1584383135067.png?936x1160',
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffbccaca),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  }),
            ),
            Expanded(child: Container()),
            // ---------------------- Price and Button Add to Cart -------------
            Row(
              children: [
                Expanded(
                  child: Text(
                    r'     $15.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(40)),
                        color: Color(0xff9db1b1)),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 27),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
