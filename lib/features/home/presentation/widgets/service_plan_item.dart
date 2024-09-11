import 'package:flutter/material.dart';


class ServicePlanItem extends StatelessWidget {
  const ServicePlanItem(
      {super.key,
      required this.servicePlan,
      required this.icon,
      required this.isSelected, required this.price});
  final String servicePlan;
  final Icon icon;
  final bool isSelected;
  final String price;

  @override
  Widget build(BuildContext context) {
        final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Card(
      shadowColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected ? primaryColor : Colors.transparent,
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      servicePlan,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                 Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        ),
                      const  Text('Exterior wash'),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        ),
                     const   Text('Exterior wash'),
                      ],
                    ),
                const    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        ),
                        Text('Exterior wash'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: primaryColor,
                        ),
                        Text('Exterior wash'),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(price),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
