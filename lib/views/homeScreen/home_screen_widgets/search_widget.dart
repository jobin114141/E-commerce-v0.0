import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: scrrenWidth * 0.7,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Container(
                    child:
                        Image(image: AssetImage("assets/images/sample.png"))),
                hintText: "  Search For Your Mood",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: primaryButtonClr), // Default border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: primaryButtonClr), // Border when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: primaryButtonClr, width: 2), // Border when focused
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.grey), // Border when disabled
                ),
              ),
            ),
          ),
          Container(
            width: scrrenWidth * 0.13,
            child: Image.asset("assets/images/Filter.png"),
            decoration: BoxDecoration(
                border: Border.all(color: primaryButtonClr),
                borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }
}
