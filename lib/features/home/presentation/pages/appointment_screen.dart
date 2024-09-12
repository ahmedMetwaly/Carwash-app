import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/features/home/presentation/widgets/appointment_details_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_utils.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Static data for the appointment
    // String appointmentId = "123456"; // Static appointment ID
    String date =
        "${AuthenticationBloc.user.appointment!.time!}, ${AuthenticationBloc.user.appointment!.date!}";
    String location = AuthenticationBloc.user.address!.address!;
    String paymentMethod = AuthenticationBloc.user.appointment!.paymentMethod!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Wash'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: "Your Appointment"
            const Text(
              'Your Appointment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Appointment details wrapped inside a Card with border and shadow
            AppointmentDetailsCard(
                date: date, location: location, paymentMethod: paymentMethod),
            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.04),
            ),

            // Display the QR code image
            Center(
              child: Image.asset(
                'assets/images/Standard.png', // Path to your asset image
                height: MediaQueryUtils.getHeightPercentage(context, 0.30),
                width: MediaQueryUtils.getWidthPercentage(context, 0.5),
              ),
            ),

            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.04),
            ),

            // Full-width Edit Appointment Button
            SizedBox(
              width: MediaQueryUtils.getScreenWidth(
                  context), // Full width of the screen
              height: MediaQueryUtils.getHeightPercentage(context, 0.06),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary,
                ),
                onPressed: () {
                  // Handle edit appointment
                },
                child: const Text(
                  'Edit Appointment',
                  style: TextStyle(
                    color: ColorsManager.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQueryUtils.getWidthPercentage(context, 0.02),
            ),

            // Full-width Cancel Appointment Button (Outlined)
            SizedBox(
              width: MediaQueryUtils.getScreenWidth(
                  context), // Full width of the screen
              height: MediaQueryUtils.getHeightPercentage(context, 0.06),
              child: OutlinedButton(
                onPressed: () {
                  // Handle cancel appointment
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text('Cancel Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
