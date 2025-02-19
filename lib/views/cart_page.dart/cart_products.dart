import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/models/cart_model.dart';

class CartProducts extends StatefulWidget {
  final List<CartModel> cartItems;

  const CartProducts({super.key, required this.cartItems});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.55,
      child: ListView.separated(
          itemBuilder: (ctx, index) {
            if (index == 0) {
              // Header Section (My Cart & Remove Button)
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Cart",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.cartItems.clear();
                        });
                      },
                      child: Row(
                        children: [
                          
                          Text(
                            "${widget.cartItems.length}  ",
                            style: TextStyle(color: primaryColor),
                          ),Icon(
                            Icons.delete,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            final Item = widget.cartItems[index - 1];
            return Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (check == true) {
                            check = false;
                          } else {
                            check = true;
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: primaryColor),
                              shape: BoxShape.rectangle),
                          child: check == true
                              ? Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryColor),
                                  child: Icon(Icons.check),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ),
                    // listing iteam
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                            color: lightwhitebg),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 10, top: 20, bottom: 20),
                              child: Container(
                                width: 85,
                                height: 85,
                                child:
                                    Image.asset("assets/images/featured1.png"),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Item.productName}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Black - UK IIS",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "\u0024 ${Item.price}",
                                    style: TextStyle(
                                        fontSize: 13,
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
          itemCount: widget.cartItems.length + 1),
    );
  }
}
