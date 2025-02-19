import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/models/cart_model.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});
  List<CartModel> cartItmes = [
    CartModel(id: 1, productName: "Adidas Shoes", price: 200.0, quantity: 1),
    CartModel(
      id: 2,
      productName: "Nike1 T-Shirt",
      price: 300.0,
      quantity: 1,
    ),
    CartModel(
      id: 2,
      productName: "Nike2 T-Shirt",
      price: 300.0,
      quantity: 1,
    ),
    CartModel(
      id: 2,
      productName: "Nike3 T-Shirt",
      price: 300.0,
      quantity: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents keyboard overflow issues
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Allows it to shrink when needed
          children: [
            Container(
              height: scrrenHeight * 0.55,
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      // Header Section (My Cart & Remove Button)
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "(Remove ${cartItmes.length})",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    final Item = cartItmes[index - 1];
                    return Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Container(
                        child: Row(
                          children: [
                            // listing iteam
                            Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                    color: lightwhitebg),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 10,
                                          top: 20,
                                          bottom: 20),
                                      child: Container(
                                        width: 85,
                                        height: 85,
                                        child: Image.asset(
                                            "assets/images/featured1.png"),
                                      ),
                                    ),
                                    Container(
                                      width: scrrenWidth * 0.59,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${Item.productName}",
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            "Black - UK IIS",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${Item.price}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => SizedBox(height: 15),
                  itemCount: cartItmes.length + 1),
            )
          ],
        ),
      ),
    );
  }
}
