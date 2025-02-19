import 'package:flutter/material.dart';
import 'package:tanzero/views/common_widgets/bottom_nav_bar.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/homeScreen/home_page.dart';
import 'package:tanzero/views/splash_screens/splach_screen_1.dart';
import 'package:tanzero/views/common_widgets/gradent_color_background.dart';

class SplachScreen2 extends StatefulWidget {
  const SplachScreen2({super.key});

  @override
  State<SplachScreen2> createState() => _SplachScreen2State();
}

class _SplachScreen2State extends State<SplachScreen2> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, Animation, secondaryAnimation) =>
                      SplachScreen1(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ));
          }
        },
        child: Stack(
          children: [
            GradentColorBackground(),
            Positioned(
                top: scrrenHeight * 0.1,
                child: SizedBox(
                  width: scrrenWidth,
                  child: Column(
                    children: [
                      Text(
                        "Have the best",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 36,
                            color: splTextSecondaryLightBlackColor),
                      ),
                      Text(
                        "Shoping Experience",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Rejuvenate your body and mind with our all-",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: splTextSecondaryLightBlackColor),
                      ),
                      Text(
                        "inclusive yoga app. Explore expert-guided ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: splTextSecondaryLightBlackColor),
                      ),
                      Text(
                        "sessions and tailored routines.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: splTextSecondaryLightBlackColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: SizedBox(
                            width: scrrenWidth,
                            height: 75,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryButtonClr)),
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return BottomNavBar();
                                  }));
                                },
                                child: Text(
                                  "Start Your Shopping",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: scrrenHeight * 0.01,
              child: SizedBox(
                width: scrrenWidth,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Image.asset("assets/images/img1.png"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
