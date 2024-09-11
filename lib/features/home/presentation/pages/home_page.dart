import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "${S.current.goodMorning} ${AuthenticationBloc.user.name!}",
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
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const SizedBox(height: 24),
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (context, index) => const AppointmentItem(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
