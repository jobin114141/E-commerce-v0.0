import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';

class CatagoriesWidget extends StatefulWidget {
  const CatagoriesWidget({super.key});

  @override
  State<CatagoriesWidget> createState() => _CatagoriesWidgetState();
}

class _CatagoriesWidgetState extends State<CatagoriesWidget> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catagories for you",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: splTextSecondaryLightBlackColor),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: scrrenHeight * 0.09,
          width: scrrenWidth,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: scrrenWidth * 0.02,
                );
              },
              scrollDirection: Axis.horizontal, // Scroll horizontally
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Container(
                  width: scrrenWidth * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryButtonClr),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset("assets/images/Group.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("sample1")
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
