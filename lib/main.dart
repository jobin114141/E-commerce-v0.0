import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanzero/views/boarding_screens/boarding_screen_1.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/common_widgets/bottom_nav_bar.dart';
import 'package:tanzero/views/homeScreen/home_page.dart';
import 'package:tanzero/views/splash_screens/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 2408),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: ThemeData.light().textTheme.copyWith(
                    bodyLarge:
                        GoogleFonts.poppins(), // Customize specific styles
                  ),
              colorScheme: ColorScheme.fromSeed(seedColor: primaryButtonClr),
              useMaterial3: true,
            ),
            home: BottomNavBar(),
          );
        });
  }
}
