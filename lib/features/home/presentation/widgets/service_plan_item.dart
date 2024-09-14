import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_utils.dart';
import '../../data/models/services_model.dart';

class ServicePlanItem extends StatelessWidget {
  const ServicePlanItem(
      {super.key,
      required this.servicePlan,
      required this.img,
      required this.isSelected,
      required this.price});
  final ServicesPlan servicePlan;
  final String img;
  final bool isSelected;
  final String price;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: MediaQueryUtils.getScreenWidth(context),
      child: Card(
        shadowColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? primaryColor : Colors.transparent,
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(
            MediaQueryUtils.getHeightPercentage(context, 0.011),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        img,
                        height:
                            MediaQueryUtils.getHeightPercentage(context, 0.060),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        servicePlan.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                          Text(
                            servicePlan.services[0],
                            style: const TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            width: MediaQueryUtils.getWidthPercentage(
                                context, 0.009),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                          Text(
                            servicePlan.services[1],
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            MediaQueryUtils.getWidthPercentage(context, 0.005),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                          Text(
                            servicePlan.services[2],
                            style: const TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            width: MediaQueryUtils.getWidthPercentage(
                                context, 0.009),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                          Text(
                            servicePlan.services[3],
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "$price EGP",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorsManager.primary,
                    ),
                  ),
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
