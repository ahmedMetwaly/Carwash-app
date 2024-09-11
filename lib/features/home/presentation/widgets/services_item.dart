import 'package:flutter/material.dart';

import '../../data/models/services_model.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({
    super.key,
    required this.servicesItem,
  });
  final ServicesModel servicesItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 35,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(servicesItem.icon),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
