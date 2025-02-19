import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/common_widgets/gradent_color_background.dart';
import 'package:tanzero/views/homeScreen/home_screen_widgets/catagories_widget.dart';
import 'package:tanzero/views/homeScreen/home_screen_widgets/drower_namaste_widget.dart';
import 'package:tanzero/views/homeScreen/home_screen_widgets/featured_widget.dart';
import 'package:tanzero/views/homeScreen/home_screen_widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GradentColorBackground(),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: scrrenWidth * 0.07, right: scrrenWidth * 0.07),
                child: Column(
                  children: [
                    DrowerNamasteWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    SearchWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    CatagoriesWidget(),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              FeaturedWidget()
            ],
          ),
        ],
      ),
    );
  }
}
