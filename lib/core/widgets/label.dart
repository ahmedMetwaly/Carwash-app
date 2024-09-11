import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.labelTitle, required this.color, this.labelColor, this.labelStyle});
final String labelTitle;
final Color color;
final Color ? labelColor;
final TextStyle ? labelStyle;
  @override
  Widget build(BuildContext context) {
    return  Container(
           
            padding: const EdgeInsets.symmetric(vertical:8,horizontal: 10),
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: Center(
              child: Text(labelTitle,
                  style: labelStyle?? Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: labelColor?? Theme.of(context).colorScheme.inversePrimary)),
            ),
          );
  }
}