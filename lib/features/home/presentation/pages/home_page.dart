import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:carwashapp/features/home/presentation/pages/about_us_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query_utils.dart';
import '../../../../core/utils/values.dart';
import '../../data/models/services_model.dart';
import '../widgets/display_appointment.dart';
import '../widgets/services_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.pSocialBtnVPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.030),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Hey,\n ${AuthenticationBloc.user.name!}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications_none,
                        size: 32, color: primaryColor),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                'A clean car is a Happy Car!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.030),
              ),
              const Text(
                'We offer a wide range of services at your convenience ...',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.030),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) =>
                      ServicesItem(servicesItem: servicesList[index]),
                ),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.030),
              ),
              const Text(
                'Your Appointment',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.020),
              ),
              const DisplayAppointment(),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.050),
              ),
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: MediaQueryUtils.getWidthPercentage(context, 0.020),
              ),
              Container(
                height: MediaQueryUtils.getWidthPercentage(context, 0.38),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/car-wash3.jpg'), // Replace with your image path
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.primary),
                        onPressed: () {
                          // Your button action here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsPage()));
                        },
                        child: const Text(
                          'About Us',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
