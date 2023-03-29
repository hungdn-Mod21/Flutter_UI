import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  // tên thẻ
  final heroTag;
  // tên product
  final foodName;
  // giá product
  final foodPrice;

  const DetailsPage({super.key, this.heroTag, this.foodName, this.foodPrice});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // hiển thị card
  var selectedCard = 'WEIGHT';

  int numberProduct = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      // ---------------------------- AppBar ---------------------------------
      appBar: AppBar(
        // ----- Icon back
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent, // màu nền
        elevation: 0.0, // đổ bóng AppBar
        // ----- Text Details
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        // ----- Icon drawer
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      // ------------------------------ Content ------------------------------
      body: ListView(children: [
        Stack(children: [
          // ----- Nền content
          Container(
            height: MediaQuery.of(context).size.height - 82.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent, // màu nền trong suốt
          ),
          // ----- Nền trắng
          Positioned(
            top: 80.0, // cách top
            child: Container(
                decoration: BoxDecoration(
                    // bo 2 góc trên
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height - 100.0,
                width: MediaQuery.of(context).size.width),
          ),
          // ----- Image product
          Positioned(
            top: 30.0, // cách top
            left: (MediaQuery.of(context).size.width / 2) - 100.0, // cách left
            // Hero : chuyển động widget
            child: Hero(
              tag: widget.heroTag, // tên thẻ
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.heroTag),
                          fit: BoxFit.cover)),
                  height: 200.0,
                  width: 200.0),
            ),
          ),
          // ----- Conttent product
          Positioned(
            top: 250.0, // cách top
            left: 25.0, // cách left
            right: 25.0, // cách right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- Name product
                Text(
                  widget.foodName,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                // --- Price and number Product
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.foodPrice,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.grey),
                    ),
                    Container(height: 25.0, color: Colors.grey, width: 1.0),
                    Container(
                      width: 125.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: Color(0xFF7A9BEE)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Icon delete product
                          InkWell(
                            onTap: () {
                              setState(() {
                                numberProduct = numberProduct - 1;
                                if (numberProduct < 0) {
                                  numberProduct = 0;
                                }
                              });
                            },
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color(0xFF7A9BEE)),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          // Number product
                          Text('$numberProduct',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0)),
                          // Icon update product
                          InkWell(
                            onTap: () {
                              setState(() {
                                numberProduct = numberProduct + 1;
                              });
                            },
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF7A9BEE),
                                  size: 20.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                // ----- List product
                Container(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildInfoCard('WEIGHT', '300', 'G'),
                        SizedBox(width: 10.0),
                        _buildInfoCard('CALORIES', '267', 'CAL'),
                        SizedBox(width: 10.0),
                        _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                        SizedBox(width: 10.0),
                        _buildInfoCard('AVAIL', 'NO', 'AV')
                      ],
                    )),
                SizedBox(height: 20.0),
                // ----- Button Buy
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                        color: Colors.black),
                    height: 50.0,
                    child: Center(
                      child: Text("\$ ${numberProduct * 24}.00",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat')),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ]),
    );
  }

  // ------ Item list Product
  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          // hiện item đc chọn
          selectCard(cardTitle);
        },
        // chuyển động widget
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            // curve : đường cong
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: // check color bground
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard // check color boder
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Title
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  // Text content
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  // reset lại cardTitle đc chọn
  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
