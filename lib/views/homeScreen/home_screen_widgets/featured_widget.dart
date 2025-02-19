import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';

class FeaturedWidget extends StatefulWidget {
  const FeaturedWidget({super.key});

  @override
  State<FeaturedWidget> createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(  left: scrrenWidth * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured for you",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100,color: splTextSecondaryLightBlackColor),
          ),
          SizedBox(
            height: scrrenHeight * 0.37,
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
                    width: scrrenWidth * 0.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryButtonClr),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: scrrenWidth * 0.05, right: scrrenWidth * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: scrrenWidth,
                            child: Image.asset(
                              "assets/images/featured1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bikram yoga",
                                    style:
                                        TextStyle(fontSize: scrrenWidth * 0.045),
                                  ),
                                  Text("12 Lessons | Beginner",
                                      style: TextStyle(
                                          fontSize: scrrenWidth * 0.03)),
                                  Text("123,45 people Loved it",
                                      style: TextStyle(
                                          fontSize: scrrenWidth * 0.02))
                                ],
                              )),
                              Align(
                                alignment: Alignment(0, -0.3),
                                child: Container(
                                  width: scrrenWidth * 0.13,
                                  height: scrrenWidth * 0.13,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryButtonClr),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Icon(Icons.heart_broken_sharp),
                                ),
                              ),
                            ],
                          ),
                           Spacer(),
                          ElevatedButton(
                              style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                  backgroundColor:
                                      WidgetStatePropertyAll(lightGreenbg),
                                  minimumSize: WidgetStatePropertyAll(
                                      Size(scrrenWidth, scrrenHeight * 0.07))),
                              onPressed: () {},
                              child: Text("Start training")),
                          Spacer(),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
