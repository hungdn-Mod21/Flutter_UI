import 'package:flutter/material.dart';

class AnimatedHover extends StatefulWidget {
  final Widget child;
  final Size size;
  final Color hoverColor, bgColor;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final Border border;

  const AnimatedHover(
      {super.key,
      // child Widget
      required this.child,
      // kích thước
      this.size = const Size(440, 440),
      // màu nền khi hover
      this.hoverColor = const Color(0xffFBE851),
      // màu nền
      this.bgColor = const Color(0xffE9EFF3),
      // tỷ lệ thay đổi khi hover
      this.offset = const Offset(8, 8),
      // đường cong
      this.curve = Curves.easeOutBack, // giảm bớt khi trở lại
      // thời gian chờ animated
      this.duration = const Duration(milliseconds: 40),
      // đường viền
      this.border = const Border()});

  @override
  State<AnimatedHover> createState() => _AnimatedHoverState();
}

class _AnimatedHoverState extends State<AnimatedHover> {
  // attribute check Hover
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior : cắt nội dung
      clipBehavior: Clip.none, // ko cắt
      children: [
        // ---------------------- Hộp chứa để che nền ------------------------
        Container(
          height: widget.size.height,
          width: widget.size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        // --------------------------- Form Login ----------------------------
        // AnimatedPositioned : chuyển động địa chỉ
        AnimatedPositioned(
          duration: widget.duration, // chờ 40s
          curve: widget.curve,
          // thay đổi tọa độ khi hover
          top: _isHover ? -widget.offset.dy : 0,
          right: _isHover ? widget.offset.dx : 0,
          child: InkWell(
            // Khi tap
            onTap: () {},
            // Khi hover
            onHover: (value) {
              setState(() {
                _isHover = value;
              });
            },
            // che mờ màu viền khi Hover
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            // AnimatedContainer : Cont chuyển động
            child: AnimatedContainer(
              duration: Duration(milliseconds: 20),
              height: widget.size.height,
              width: widget.size.width,
              decoration: BoxDecoration(
                color: _isHover ? widget.hoverColor : widget.bgColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: widget.border,
              ),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
