import 'package:flutter/material.dart';
import 'package:widget_beautiful/button_hover_3d/glowing_button.dart';

class BtnHover3D extends StatefulWidget {
  const BtnHover3D({super.key});

  @override
  State<BtnHover3D> createState() => _BtnHover3DState();
}

class _BtnHover3DState extends State<BtnHover3D> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            // Nút phát sáng
            GlowingButton(
              color1: Colors.orange,
              color2: Colors.red,
            ),
            GlowingButton(
              color1: Colors.pinkAccent,
              color2: Colors.indigoAccent,
            ),
            GlowingButton(),
          ],
        ),
      ),
    );
  }
}