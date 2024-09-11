import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class CustomDataView extends StatelessWidget {
  final String? dataText;
  final String? dataText2;
  final IconData icon;
  final String? title;

  const CustomDataView(
      {super.key,
      required this.dataText,
      this.dataText2,
      required this.icon,
      this.title});

  @override
  Widget build(BuildContext context) {
        final Color primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title!,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const Gap(50),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  dataText!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                // const Gap(10),
                Text(
                  dataText2!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
