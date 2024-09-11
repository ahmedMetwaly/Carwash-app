import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: groupValue == value ? Colors.blue[100] : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RadioListTile<String>(
        title: Row(
          children: [
            // Uncomment and add your image assets here
            // Image.asset('assets/$value.png', width: 40, height: 40),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
