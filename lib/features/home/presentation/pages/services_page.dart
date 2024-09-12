import 'package:carwashapp/core/widgets/custom_button.dart';
import 'package:carwashapp/features/progress/progress/progress_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../data/models/services_model.dart';
import '../widgets/service_plan_item.dart';
// import '../widgets/service_plan_item.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String servicePlanSelected = 'Standard Wash';
  String selectedPrice = '500';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text(
            'Services',
            style: TextStyle(color: ColorsManager.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shadowColor: Colors.black38,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: ColorsManager.primary),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          onTap: () => setState(() {
            servicePlanSelected = 'Standard Wash';
            selectedPrice = servicePlan[0].price;
          }),
          child: ServicePlanItem(
            servicePlan: servicePlan[0],
            img: 'assets/images/Standard.png',
            isSelected: servicePlanSelected == 'Standard Wash' ? true : false,
            price: servicePlan[0].price,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            servicePlanSelected = 'Deluxe Wash';
            selectedPrice = servicePlan[1].price;
          }),
          child: ServicePlanItem(
            servicePlan: servicePlan[1],
            img: 'assets/images/Deluxe.png',
            isSelected: servicePlanSelected == 'Deluxe Wash' ? true : false,
            price: servicePlan[1].price,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            servicePlanSelected = 'Premium Wash';
            selectedPrice = servicePlan[2].price;
          }),
          child: ServicePlanItem(
            servicePlan: servicePlan[2],
            img: 'assets/images/Premium.png',
            isSelected: servicePlanSelected == 'Premium Wash' ? true : false,
            price: servicePlan[2].price,
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
        CustomButton(
          text: 'Book Now',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProgressTrackerScreen(
                  servicePlan: servicePlanSelected,
                  price: selectedPrice,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
