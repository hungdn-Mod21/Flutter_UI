import 'package:flutter/material.dart';
import 'package:food_healthy/detailsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // màu nền
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          // --------------------------- App Bar -------------------------------
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ----- Icon back
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                // ----- Icon menu
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          // -------------------- Text Healthy Food ----------------------------
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: const <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          // --------------------- Content Products ----------------------------
          Container(
            // chiều cao
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              // bo viền
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              // primary : Tạo một mảng widget tuyến tính, có thể cuộn từ một [Danh sách] rõ ràng
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 300.0,
                        // ----- List products
                        child: ListView(children: [
                          _buildFoodItem(
                              'assets/plate1.png', 'Salmon bowl', '\$24.00'),
                          _buildFoodItem(
                              'assets/plate2.png', 'Spring bowl', '\$22.00'),
                          _buildFoodItem(
                              'assets/plate6.png', 'Avocado bowl', '\$26.00'),
                          _buildFoodItem(
                              'assets/plate5.png', 'Berry bowl', '\$24.00')
                        ]))),
                // --------- Icon Navi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // ----- Icon Search
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    // ----- Icon bag
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_basket, color: Colors.black),
                      ),
                    ),
                    // ----- Checkout
                    Container(
                      height: 65.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF1C1428)),
                      child: const Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 15.0))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Item for list product
  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath, foodName: foodName, foodPrice: price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ----- Product
            Container(
              child: Row(children: [
                // Hero : chuyển động widget
                Hero(
                    tag: imgPath, // tên thẻ
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
                SizedBox(width: 10.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(foodName,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(price,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.grey))
                ]),
              ]),
            ),
            // ----- Add product
            IconButton(
                icon: Icon(Icons.add), color: Colors.black, onPressed: () {})
          ],
        ),
      ),
    );
  }
}
