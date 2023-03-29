import 'package:animation_login/animated_hover.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // AnimatedHover : class tự tạo
        child: AnimatedHover(
          // curve : đường cong
          curve: Curves.fastOutSlowIn, // fastOutSlowIn : ra nhanh vào chậm
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // -------------------- Text Get Started -------------------------
              Text(
                "Get Started",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              // ----------------------- Form Main -----------------------------
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      // Form : tạo vùng chứa cho widget
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ----- Text Full name
            AnimatedHover(
              size: Size(360, 56),
              hoverColor: Colors.white,
              bgColor: Colors.white,
              border: Border.all(),
              offset: Offset(6, 6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: TextFormField(
                  onSaved: (name) {},
                  decoration: InputDecoration(
                    hintText: 'Full name',
                  ),
                ),
              ),
            ),
            // ----- Text Email
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AnimatedHover(
                size: Size(360, 56),
                hoverColor: Colors.white,
                bgColor: Colors.white,
                border: Border.all(),
                offset: Offset(6, 6),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: TextFormField(
                    onSaved: (email) {},
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                    ),
                  ),
                ),
              ),
            ),
            // ----- Text Password
            AnimatedHover(
              size: Size(360, 56),
              hoverColor: Colors.white,
              bgColor: Colors.white,
              border: Border.all(),
              offset: Offset(6, 6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: TextFormField(
                  onSaved: (password) {},
                  obscureText: true, // che mật khẩu
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // ----- Button Login
            AnimatedHover(
              size: Size(88, 48),
              curve: Curves.fastOutSlowIn,
              offset: Offset(6, 6),
              child: ElevatedButton(
                onPressed: () {},
                // trang trí button
                style: ElevatedButton.styleFrom(
                  elevation: 0, // đổ bóng
                  minimumSize: Size(88, 50), // kích thước nhỏ nhất
                  backgroundColor: Color(0xff556124), // màu nền
                  foregroundColor: Color(0xffD9E1BE), // màu chữ
                  // RoundedRectangleBorder : Đường viền hình chữ nhật tròn
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
