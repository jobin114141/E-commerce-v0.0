import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/parallel_axix_section/parallelaxix_common_widegts.dart';

class Parallelaxixsection extends StatelessWidget {
  const Parallelaxixsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            CustomText(
              text: "MADE TO",
              color: SecondaryColor2,
            ),
            const SizedBox(
              width: 100,
            )
          ],
        ),
         Row(
          children: [
            const Spacer(),
            CustomText(
              text: "MOVE MADE",
              color: SecondaryColor2,
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),Row(
          children: [
            const Spacer(),
            CustomText(
              text: "FOR",
              color: SecondaryColor2,
            ),
            const SizedBox(
              width: 50,
            )
          ],
        ),Row(
          children: [
            const Spacer(),
            CustomText(
              text: "YOU        _",
              color: SecondaryColor2,
            ),
            const SizedBox(
              width: 20,
            )
          ],
        )
      ],
    );
  }
}
