import 'package:flutter/material.dart';

import '../../../auth/controller/auth_bloc/auth_bloc.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Static data for the appointment
    String appointmentId = "123456"; // Static appointment ID
    String date = "${AuthenticationBloc.user.appointment!.time!}, ${AuthenticationBloc.user.appointment!.date!}";
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
            AppointmentDetailsCard(date: date, location: location, paymentMethod: paymentMethod),
            const SizedBox(height: 50),

            // Display the QR code image
            Center(
              child: Image.asset(
                'assets/images/Standard.png', // Path to your asset image
                width: 200,
                height: 200,
              ),
            ),
            // const SizedBox(height: 16),

            // Centered Text after QR code
            // const Center(
            //   child: Column(
            //     children: [
            //       Text(
            //         'Scan this code to start your car',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       Text(
            //         'with appointment.',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 130),

            // Full-width Edit Appointment Button
            SizedBox(
              width: double.infinity, // Full width of the screen
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit appointment
                },
                child: const Text('Edit Appointment'),
              ),
            ),
            const SizedBox(height: 8),

            // Full-width Cancel Appointment Button (Outlined)
            SizedBox(
              width: double.infinity, // Full width of the screen
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

class AppointmentDetailsCard extends StatelessWidget {
  const AppointmentDetailsCard({
    super.key,
    required this.date,
    required this.location,
    required this.paymentMethod,
  });

  final String date;
  final String location;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Date and Time
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue),
                const SizedBox(width: 8),
                Text(date, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
    
            // Display Location
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
    
            // Display Payment Method
            Row(
              children: [
                const Icon(Icons.payment, color: Colors.blue),
                const SizedBox(width: 8),
                Text(paymentMethod,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
