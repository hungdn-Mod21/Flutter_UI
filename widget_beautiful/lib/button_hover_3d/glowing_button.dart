import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  // 2 colors for button
  final Color color1;
  final Color color2;

  const GlowingButton(
      {super.key, this.color1 = Colors.cyan, this.color2 = Colors.greenAccent});

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var glowing = true; // check phát sáng
  var scale = 1.0; // tỷ lệ phóng to

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // khi nhả chuột tắt phát sáng
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      // khi nhấn chuột bật phát sáng
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      // AnimatedContainer : chuyển động nút
      child: AnimatedContainer(
        // transform : biến đổi kích cỡ nút
        transform: Matrix4.identity()..scale(scale), // thay đổi tỷ lệ
        duration: const Duration(milliseconds: 10), // thời gian thay đổi
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            // màu lan
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            // đổ bóng
            boxShadow: glowing // check đổ bóng
                ? [
                    // các lớp đổ bóng
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6), // độ mờ đổ bóng
                      spreadRadius: 1, // độ lan của bóng
                      blurRadius: 16, // độ mờ của bóng
                      offset: const Offset(-8, 0), // tọa độ đổ bóng
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              glowing ? Icons.lightbulb : Icons.lightbulb_outline,
              color: Colors.white,
            ),
            Text(
              glowing ? "Glowing" : "Dimmed",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
