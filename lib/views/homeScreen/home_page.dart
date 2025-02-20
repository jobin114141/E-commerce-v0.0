import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tanzero/views/colors_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<Map<String, dynamic>> categories = [
    {"name": "Sports", "icon": Icons.sports_soccer, "color": Colors.orange},
    {"name": "Books", "icon": Icons.book, "color": Colors.purple},
    {"name": "Toys", "icon": Icons.toys, "color": Colors.teal},
    {"name": "Electronics", "icon": Icons.devices, "color": Colors.blue},
    {"name": "Clothing", "icon": Icons.shopping_bag, "color": Colors.red},
    {"name": "Home & Kitchen", "icon": Icons.kitchen, "color": Colors.green},
    {"name": "Beauty", "icon": Icons.brush, "color": Colors.pink},
    {"name": "Automobile", "icon": Icons.directions_car, "color": Colors.grey},
  ];

  List<Map<String, dynamic>> dressesItems = [
    {
      "name": "Elegant Red Gown",
      "description": "A stylish evening gown with a flowing silhouette.",
      "price": 79.99,
      "rating": 4.5,
      "image": "https://via.placeholder.com/150/FF0000/FFFFFF?text=Red+Gown"
    },
    {
      "name": "Casual Summer Dress",
      "description": "Lightweight and breathable fabric, perfect for summer.",
      "price": 39.99,
      "rating": 4.2,
      "image": "https://via.placeholder.com/150/FFFF00/000000?text=Summer+Dress"
    },
    {
      "name": "Classic Black Dress",
      "description": "A must-have black dress for any formal occasion.",
      "price": 59.99,
      "rating": 4.8,
      "image": "https://via.placeholder.com/150/000000/FFFFFF?text=Black+Dress"
    },
    {
      "name": "Floral Maxi Dress",
      "description": "Beautiful floral prints with a comfortable fit.",
      "price": 49.99,
      "rating": 4.3,
      "image": "https://via.placeholder.com/150/008000/FFFFFF?text=Maxi+Dress"
    },
    {
      "name": "Denim Shirt Dress",
      "description": "Trendy and casual denim dress for daily wear.",
      "price": 45.99,
      "rating": 4.1,
      "image": "https://via.placeholder.com/150/0000FF/FFFFFF?text=Denim+Dress"
    },
  
  ];

  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: topHeader(),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true, // Enables the background color
                        fillColor: Colors.grey[200],
                        prefixIcon: Container(
                            child: Image(
                                image: AssetImage("assets/images/sample.png"))),
                        hintText: "  Search For Your Mood",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.transparent), // Border when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.transparent), // Border when focused
                        ),
                      ),
                    ),
                  ),
                ),

// TODO category
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 200.h,
                        child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 22,
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      categories[index]["icon"],
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${categories[index]["name"]}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(),
                  width: scrrenWidth,
                  height: 600.h,
                  child: Image.asset(
                    "assets/images/IMG_6116.PNG",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontSize: 54.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w400,
                            color: SecondaryColor2),
                      ),
                    ],
                  ),
                ),
//TODO items
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2, // 2 items per row
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: List.generate(dressesItems.length, (index) {
                      return StaggeredGridTile.count(
                        crossAxisCellCount:
                            1, // Each takes full width in the row
                        mainAxisCellCount:
                            index.isEven ? 1.5 : 2.5, // Some items are taller
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(22, 0, 0, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15), // Apply border radius
                            child: Stack(
                              children: [
                                /// ✅ **Make Image Fill Entire Space**
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.black,
                                    child: Image.asset(
                                      "assets/images/Screenshot 2025-02-20 170209.png",
                                      fit: BoxFit
                                          .cover, // Ensures the image covers the whole space
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${dressesItems[index]["name"]}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                        Text(
                                          "Rs ${dressesItems[index]["price"]}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget topHeader() {
  return Padding(
    padding: EdgeInsets.only(top: 68.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: TextStyle(fontSize: 64.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}
