import 'package:flutter/material.dart';

class GradentColorBackground extends StatefulWidget {
  const GradentColorBackground({super.key});

  @override
  State<GradentColorBackground> createState() => _GradentColorBackgroundState();
}

class _GradentColorBackgroundState extends State<GradentColorBackground> {
  @override
  Widget build(BuildContext context) {
    double scrrenHeight = MediaQuery.of(context).size.height;
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: scrrenWidth,
        height: scrrenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
         colors: [
            Color(0xFFD8ECC7), // Light green at the top
            Color(0xFFF5FBEF), // Very light green at the bottom
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )));
  }
}
