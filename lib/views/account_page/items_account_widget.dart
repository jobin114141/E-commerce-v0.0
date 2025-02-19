import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';

Widget itemsAccountPageWidget(double scrrenWidth, String text) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: scrrenWidth * 0.02,
              ),
              Text(
                text,
                style: TextStyle(fontSize: scrrenWidth * 0.04),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: scrrenWidth * 0.045,
              ),
              SizedBox(
                width: scrrenWidth * 0.02,
              ),
            ],
          ),
        ),
        Divider(
          color: const Color.fromARGB(66, 180, 180, 180),
        )
      ],
    ),
  );
}
