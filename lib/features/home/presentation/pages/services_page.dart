import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:carwashapp/features/progress/progress/progress_tracker.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_utils.dart';
import '../../data/models/services_model.dart';
import '../widgets/service_plan_item.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String servicePlanSelected = 'Standard Wash';
  String selectedPrice = '50';

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black38,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryColor),
            onPressed: () {},
          ),
        ],
        leading: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.025),
            ),
            GestureDetector(
              onTap: () => setState(() {
                servicePlanSelected = 'Standard Wash';
                selectedPrice = servicePlan[0].price;
              }),
              child: ServicePlanItem(
                servicePlan: servicePlan[0],
                img: 'assets/images/Standard.png',
                isSelected:
                    servicePlanSelected == 'Standard Wash' ? true : false,
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
                isSelected:
                    servicePlanSelected == 'Premium Wash' ? true : false,
                price: servicePlan[2].price,
              ),
            ),
            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.08),
            ),
            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressTrackerScreen(
                      title: servicePlanSelected,
                      price: selectedPrice,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(350, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
