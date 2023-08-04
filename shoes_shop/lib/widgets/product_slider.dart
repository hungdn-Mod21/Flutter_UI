// pub 'carousel_slider' (thanh trượt ngang)
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// --------------- UI thanh thanh trượt sản phẩm , ActiveDot(dấu chấm hoạt động) -------------------
class ActiveDot extends StatelessWidget {
  const ActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 20,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

// --------------- UI thanh thanh trượt sản phẩm , InactiveDot(dấu chấm không hoạt động) -------------------
class InactiveDot extends StatelessWidget {
  const InactiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 20,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3), // withOpacity : độ mờ
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

// ------------------------------- ProductSlider (thanh trượt sản phẩm) ------------------------------------
class ProductSlider extends StatefulWidget {
  // List Item
  final List items;

  // Contrusctor
  const ProductSlider({super.key, required this.items});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  // biến vị trí thanh trượt
  int activeIndex = 0;

  // function đặt lại vị trí thanh trượt
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            // CarouselSlider : Thanh trượt băng truyền ngang của pub 'carousel_slider'
            child: CarouselSlider(
              // options : tùy chọn để cấu hình carousel
              options: CarouselOptions(
                // onPageChanged : cập nhập khi page thay đổi
                onPageChanged: (index, reason) {
                  // index(vị trí trang) - reason(lý do thay đổi page)
                  setActiveDot(index); // cập nhật vị trí thanh trượt
                },
                // autoPlayCurve : kiểu animation của carouse
                autoPlayCurve: Curves
                    .fastLinearToSlowEaseIn, // fastLinearToSlowEaseIn (hiệu ứng trượt từ nhanh đến chậm)
                // Thời gian mỗi page hiển thị trước khi chuyển page
                autoPlayAnimationDuration: const Duration(seconds: 2),
                // autoPlay : thuộc tính cho phép dùng 'autoPlayAnimationDuration' để tự động chuyển page
                autoPlay: true,
                // phần trăm chiều rộng của viewport(khung nhìn) mà mỗi trang của carousel chiếm với
                viewportFraction: 0.9, // max là 1.0, min là 0.1
              ),
              // ----------- Ảnh Item -------------
              // items : danh sách các mục để hiển thị lên carousel
              items: widget.items.map((item) { /* map : dùng để chuyển đổi từng phần tử trong 'items' thành 
              một Builder và dữ liệu là 'item' */
                return Builder(builder: (BuildContext context) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          // ignore: prefer_interpolation_to_compose_strings
                          image: AssetImage("assets/images/" + item),  // đặt ảnh
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                });
              }).toList(), // chuyển thành dạng List
            ),
          ),
          // ----- Thanh trượt ------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // List.generate : tạo danh sách
            children: List.generate(
              // số lượng
              widget.items.length,
              (index) {
                // lựa chọn thanh trượt
                return activeIndex == index
                    ? const ActiveDot()
                    : const InactiveDot();
              },
            ),
          ),
        ],
      ),
    );
  }
}
