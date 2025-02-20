import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzero/views/boarding_screens/login_or_sign_up_page.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/login_reg/LogIn.dart';

class boarding_screen_1 extends StatefulWidget {
  const boarding_screen_1({super.key});

  @override
  State<boarding_screen_1> createState() => _boarding_screen_1State();
}

class _boarding_screen_1State extends State<boarding_screen_1> {
  final PageController _pageController = PageController();
  bool _isPage2Visible = false;
  double _page2Offset = 1.0;
  ValueNotifier<double> _currentPage =
      ValueNotifier(0.0); // Track current page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Show Page 2 (Slide Up)
  void showSecondPage() {
    setState(() {
      _page2Offset = 0;
      _isPage2Visible = true;
    });
  }

  // Go to Next Page
  void nextPage() {
    if (!_isPage2Visible) {
      showSecondPage();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Go to Previous Page
  void previousPage() {
    if (_pageController.page == 0) {
      setState(() {
        _page2Offset = 1.0;
        _isPage2Visible = false;
      });
    } else {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Page 1 (Intro Page)
          Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.53),
                Text("Hello Jobin",
                    style: TextStyle(fontSize: 70.sp, color: Colors.black)),
                SizedBox(height: 70.h),
                Text("Lorem Ipsum has been standard dummy text"),
                Text("the industry's standard dummy text has been"),
                Text("standard been the industry's"),
                Text("industry"),
                SizedBox(height: 180.h),
                SizedBox(
                  width: screenWidth * 0.45,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(primaryColor)),
                    onPressed: nextPage,
                    child: Text(
                      "Let's Begin",
                      style: TextStyle(
                          color: primaryColorComboSecond,
                          fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04)
              ],
            ),
          ),

          // Page 2 (Slides Up from the Bottom)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: _page2Offset * -screenHeight,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 500.h),
                  Text("Relax",
                      style: TextStyle(fontSize: 70.sp, color: Colors.black)),
                  SizedBox(height: 70.h),
                  Text("Lorem Ipsum has been standard dummy text"),
                  Text("the industry's standard dummy text has been"),
                  Text("standard been the industry's"),
                  Text("industry"),
                  SizedBox(height: 180.h),
                ],
              ),
            ),
          ),

          // Page 3 & 4 (Swipes Left-to-Right)
          if (_isPage2Visible)
            PageView(
              controller: _pageController,
              physics: _isPage2Visible
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(), // Placeholder to maintain alignment
                Container(
                  color: Colors.white,
                  height: screenHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 1300.h),
                      Text("Care",
                          style:
                              TextStyle(fontSize: 70.sp, color: Colors.black)),
                      SizedBox(height: 70.h),
                      Text("Lorem Ipsum has been standard dummy text"),
                      Text("the industry's standard dummy text has been"),
                      Text("standard been the industry's"),
                      Text("industry"),
                      SizedBox(height: 348.h),
                      Align(
                        alignment: Alignment(0, 0.9),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, Animation,
                                          secondaryAnimation) =>
                                      LoginOrSignUpPage1(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor: primaryColor),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: primaryColorComboSecond,
                          ),
                        ),
                      ),
                      // TextButton(
                      // onPressed: () {
                      //   Navigator.of(context)
                      //       .push(MaterialPageRoute(builder: (ctx) {
                      //     return LoginOrSignUpPage1();
                      //   }));
                      // },
                      //     child: LogIn())
                    ],
                  ),
                ),
              ],
            ),

          // Next Page Button (Hides on Page 4)
          if (_isPage2Visible)
            ValueListenableBuilder<double>(
              valueListenable: _currentPage,
              builder: (context, page, child) {
                return page < 1.0 // Show button only if not on Page 4
                    ? Align(
                        alignment: const Alignment(0, 0.8),
                        child: ElevatedButton(
                          onPressed: nextPage,
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor: primaryColor),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: primaryColorComboSecond,
                          ),
                        ),
                      )
                    : const SizedBox(); // Hide button on Page 4
              },
            ),
        ],
      ),
    );
  }
}

// Helper Page Widget
class Page extends StatelessWidget {
  final Color color;
  final String text;

  const Page({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
