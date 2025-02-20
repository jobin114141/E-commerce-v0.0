import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzero/views/colors_const.dart';

class LoginOrSignUpPage1 extends StatefulWidget {
  const LoginOrSignUpPage1({super.key});

  @override
  State<LoginOrSignUpPage1> createState() => _LoginOrSignUpPage1State();
}

class _LoginOrSignUpPage1State extends State<LoginOrSignUpPage1> {
  bool _isExpanding = false;
  double _expansionSize = 0;

  void _expandAnimation() {
    setState(() {
      _isExpanding = true;
      _expansionSize = MediaQuery.of(context).size.height * 2;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.53),
                Text("Hello Jobin", style: TextStyle(fontSize: 70.sp, color: Colors.white)),
                SizedBox(height: 70.h),
                Text("Welcome to Sales TOP  Platform To", style: TextStyle(fontSize: 40.sp, color: Colors.white)),
                Text("Manage your Shoping", style: TextStyle(fontSize: 35.sp, color: Colors.white)),
                SizedBox(height: 180.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 380.w,
                      height: 380.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(primaryColorComboSecond),
                        ),
                        onPressed: _expandAnimation,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(width: 60.w),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(primaryColorComboSecond)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            left: _isExpanding ? -screenWidth * 0.5 : screenWidth * 0.45,
            top: _isExpanding ? -screenHeight * 0.5 : screenHeight * 0.75,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: _expansionSize,
              height: _expansionSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to the next page!",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
