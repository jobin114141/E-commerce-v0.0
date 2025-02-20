import 'package:flutter/material.dart';
import 'package:tanzero/views/cart_page.dart/cart_products.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/common_widgets/common_buttons.dart';
import 'package:tanzero/models/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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

  void increaseQuantity(int index) {
    setState(() {
      cartItmes[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItmes[index].quantity > 1) {
        cartItmes[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(backgroundColor: primaryColorComboSecond,
        resizeToAvoidBottomInset: true, // Prevents keyboard overflow issues
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Allows it to shrink when needed
            children: [
              CartProducts(cartItems: cartItmes),
              const SizedBox(height: 10),
              promoCode(),
              cartPriceWidget(),
              MainButton2(scrrenWidth, scrrenHeight, "Go To CheckOut"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget promoCode() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor)),
                  onPressed: () {},
                  child: Text(
                    "Apply",
                    style: TextStyle(color: primaryColorComboSecond),
                  ))),
        ),
        hintText: "Promo Code",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color:
                  const Color.fromARGB(38, 88, 88, 88)), // Default border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color:
                  const Color.fromARGB(90, 88, 88, 88)), // Border when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color:
                  const Color.fromARGB(90, 88, 88, 88)), // Border when focused
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey), // Border when disabled
        ),
      ),
    ),
  );
}

Widget cartPriceWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Container(
      decoration: BoxDecoration(
          color: lightwhitebg, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            for (var item in [
              ["Total Item", "Rs 91.23"],
              ["Shipping Cost", "Rs 10.23"],
              ["Total", "Rs 101.23"]
            ]) ...[
              Row(
                children: [
                  Text(
                    item[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    item[1],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 10),
            ]
          ],
        ),
      ),
    ),
  );
}
