import 'package:flutter/material.dart';
import 'package:tanzero/views/parallelAxixsection.dart';
import 'package:tanzero/views/sample_paralleaxix_left.dart';
import 'package:tanzero/views/sample_paralleaxix_right.dart';
import 'package:tanzero/views/sample_paralleaxix_text.dart';

class YourActivity extends StatefulWidget {
  const YourActivity({super.key});

  @override
  State<YourActivity> createState() => _YourActivityState();
}

class _YourActivityState extends State<YourActivity> {
  final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
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
            height: screenHeight,
            color: Color(0xffffffff),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  child: Column(
                    children: [
                    
                      SizedBox(height: 18),
   
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                Parallelaxixsection(),
                SizedBox(
                  height: 200,
                  child: ParallaxImageScroll(scrollOffset: scrollOffset),
                ),
                SizedBox(
                  height: 300,
                  child: SampleParalleaxixText(scrollOffset: scrollOffset),
                ),
                SizedBox(
                  height: 200,
                  child: SampleParalleaxixRight(scrollOffset: scrollOffset),
                ),
              
                

              ],
            ),
          ),
        ],
      ),
    );
  }
}
