import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_utils.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({
    super.key,
    required this.text,
    this.height = 130,
    required this.title,
  });
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQueryUtils.getScreenWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.01),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.02),
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
