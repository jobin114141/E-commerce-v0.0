import 'package:flutter/material.dart';
import 'package:tanzero/views/splash_screens/splach_screen_2.dart';

class SplachScreen1 extends StatefulWidget {
  const SplachScreen1({super.key});

  @override
  State<SplachScreen1> createState() => _SplachScreen1State();
}

class _SplachScreen1State extends State<SplachScreen1> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // Swiped left
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, Animation, secondaryAnimation) =>
                      SplachScreen2(),
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
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sp-1.png"),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              bottom: scrrenHeight * 0.02,
              child: SizedBox(
                width: scrrenWidth,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Image.asset("assets/images/sp_indicator.png"),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, Animation, secondaryAnimation) =>
                                        SplachScreen2(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ));
                        },
                        child: Container(
                          child: Image.asset("assets/images/next.png"),
                        ),
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
