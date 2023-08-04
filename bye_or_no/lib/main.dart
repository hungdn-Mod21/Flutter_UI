import 'package:bye_or_no/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Say goodbye or no'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    dynamic side = MediaQuery.of(context).size.width / 8;
    return Scaffold(
      backgroundColor: const Color(0xFFDDE8F0),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            user(
              "Vũ Đức Anh",
              "https://cdn-icons-png.flaticon.com/128/4202/4202839.png",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: side,
                    child: Center(child: checkRow(index)),
                  );
                },
              ),
            ),
            user(
              "Nguyễn Thị Thanh Hoa",
              "https://cdn-icons-png.flaticon.com/128/4202/4202832.png",
            ),
          ],
        ),
      ),
    );
  }
}

Widget checkRow(int index) {
  if (index == 0) {
    return ChessBoardRow(
      isOdd: index.isOdd ? true : false,
      icons: row1White,
    );
  } else if (index == 1) {
    return ChessBoardRow(
      isOdd: index.isOdd ? true : false,
      icons: row2White,
    );
  } else if (index == 6) {
    return ChessBoardRow(
      isOdd: index.isOdd ? true : false,
      icons: row7Black,
    );
  } else if (index == 7) {
    return ChessBoardRow(
      isOdd: index.isOdd ? true : false,
      icons: row8Black,
    );
  } else {
    return ChessBoardRow(
      isOdd: index.isOdd ? true : false,
    );
  }
}

// ignore: must_be_immutable
class ChessBoardRow extends StatelessWidget {
  final bool isOdd;
  List<String>? icons;
  ChessBoardRow({super.key, required this.isOdd, this.icons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (isOdd == true) {
          if ((index + 1) % 2 == 0) {
            return Container(
              width: 45,
              decoration: const BoxDecoration(color: Color(0xFFFAF0CA)),
              child: icons == null
                  ? Container()
                  : Center(
                      child: Text(
                        icons![index].toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
            );
          } else {
            return Container(
              width: 45,
              decoration: const BoxDecoration(color: Color(0xFFFFD181)),
              child: icons == null
                  ? Container()
                  : Center(
                      child: Text(
                        icons![index].toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
            );
          }
        } else {
          if (index % 2 == 0) {
            return Container(
              width: 45,
              decoration: const BoxDecoration(color: Color(0xFFFAF0CA)),
              child: icons == null
                  ? Container()
                  : Center(
                      child: Text(
                        icons![index].toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
            );
          } else {
            return Container(
              width: 45,
              decoration: const BoxDecoration(color: Color(0xFFFFD181)),
              child: icons == null
                  ? Container()
                  : Center(
                      child: Text(
                        icons![index].toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
            );
          }
        }
      },
    );
  }
}

Widget user(String name, String image) {
  return Row(
    children: [
      const SizedBox(width: 40),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
