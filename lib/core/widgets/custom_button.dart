import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors_manager.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = const Size(350, 55),
  });
  final String text;
  final void Function()? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style:  TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
    );
  }
}
