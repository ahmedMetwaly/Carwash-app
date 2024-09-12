import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:carwashapp/features/home/presentation/pages/about_us_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/values.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/services_model.dart';
import '../widgets/appointment_item.dart';
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
              const SizedBox(height: 15),
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
              const SizedBox(height: 20),
              const Text(
                'We offer a wide range of services at your convenience ...',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) =>
                      ServicesItem(servicesItem: servicesList[index]),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Your Appointment',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const AppointmentItem(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 170,
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
