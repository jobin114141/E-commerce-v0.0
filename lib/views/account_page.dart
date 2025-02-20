import 'package:flutter/material.dart';
import 'package:tanzero/views/account_page/items_account_widget.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/my_orders/my_orders_page.dart';
import 'package:tanzero/views/your_activity.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: primaryColorComboSecond,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: scrrenHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "My Account",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: const Color.fromARGB(66, 180, 180, 180),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: scrrenWidth * 0.12,
                    backgroundColor: Colors.black,
                    child: Text(
                      "JO",
                      style: TextStyle(
                          color: Colors.white, fontSize: scrrenWidth * 0.09),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "jobu",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                      Text("jobin114141@Gmail.com"),
                      Text("8111949621")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return MyOrdersPage();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "My orders",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Customer Care",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Account Settings",
              )),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Divider(
              height: 10,
              color: const Color.fromARGB(66, 180, 180, 180),
              thickness: 18,
            ),
          ),InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return MyOrdersPage();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Saved Cards",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "My Rewards",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Address",
              )),InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return MyOrdersPage();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Notifications",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Wallet",
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return YourActivity();
                }));
              },
              child: itemsAccountPageWidget(
                scrrenWidth,
                "Return Polics",
              )),
        ],
      ),
    );
  }
}
