import 'package:flutter/material.dart';

class DrowerNamasteWidget extends StatefulWidget {
  const DrowerNamasteWidget({super.key});

  @override
  State<DrowerNamasteWidget> createState() => _DrowerNamasteWidgetState();
}

class _DrowerNamasteWidgetState extends State<DrowerNamasteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/menu.png"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Namaste,",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w200),
              ),
              Text(
                "Vani,",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            child: Image.asset("assets/images/home_scrren_pic1.png"),
          )
        ],
      ),
    );
  }
}
