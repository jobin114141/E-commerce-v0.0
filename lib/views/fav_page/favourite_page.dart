import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:tanzero/views/colors_const.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingWidget(),
          Container(
              width: double.infinity,
              height: scrrenHeight * 0.7,
              child: favIteams(scrrenHeight, scrrenWidth))
        ],
      ),
    );
  }
}

Widget headingWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "EXPLORE",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 38,
                color: SecondaryColor2),
          ),
          Text(
            "TOP BRANDS PRODUCTS",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
          )
        ],
      ),
    ),
  );
}

Widget favIteams(scrrenHeight, scrrenWidth) {
  return Swiper(
    layout: SwiperLayout.STACK,
    itemCount: 4,
    itemHeight: scrrenHeight * 0.5,
    itemWidth: scrrenWidth * 0.8,
    loop: true,
    duration: 500,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(158, 211, 211, 211),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Secondary)),
        child: Column(
          children: [
            Spacer(),
            Container(child: Image.asset("assets/images/img1.png")),
            Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: scrrenWidth * 0.11,
                    height: scrrenWidth * 0.11,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopify_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add To Bag",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
