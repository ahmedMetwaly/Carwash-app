import 'package:carwashapp/features/progress/progress/progress_tracker.dart';
import 'package:flutter/material.dart';

import '../widgets/service_plan_item.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String servicePlan = 'Standard Wash';
  
  @override
  Widget build(BuildContext context) {
        final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Services',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black38,
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_none, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => setState(() {
              servicePlan = 'Standard Wash';
            }),
            child: ServicePlanItem(
              servicePlan: 'Standard Wash',
              icon: Icon(
                Icons.panorama_photosphere_select_outlined,
                size: 40,
                color: Colors.brown[600],
              ),
              isSelected: servicePlan == 'Standard Wash' ? true : false, price: '500',
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              servicePlan = 'Deluxe Wash';
            }),
            child: ServicePlanItem(
              servicePlan: 'Deluxe Wash',
              icon: const Icon(
                Icons.panorama_photosphere_select_outlined,
                size: 40,
                color: Colors.grey,
              ),
              isSelected: servicePlan == 'Deluxe Wash' ? true : false, price: '1000',
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              servicePlan = 'Premium Wash';
            }),
            child: ServicePlanItem(
              servicePlan: 'Premium Wash',
              icon: Icon(
                Icons.panorama_photosphere_select_outlined,
                size: 40,
                color: Colors.amber[900],
              ),
              isSelected: servicePlan == 'Premium Wash' ? true : false, price: '1500',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgressTrackerScreen(),
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
    );
  }
}
