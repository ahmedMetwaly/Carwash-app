import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors_manager.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text1,
    this.text2, required this.height,
  });
  final String text1;
  final String? text2;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(45),
          Text(
            text1,
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const Gap(40),
          Text(
            text2 ?? '',
            style: const TextStyle(color: Colors.white60, fontSize: 18),
          )
        ],
      ),
    );
  }
}
