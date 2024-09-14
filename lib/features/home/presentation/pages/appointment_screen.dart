import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/core/widgets/dialogs.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_event.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:carwashapp/features/auth/data/models/appointment_model/appointment_model.dart';
import 'package:carwashapp/features/home/presentation/pages/main_page.dart';
import 'package:carwashapp/features/home/presentation/widgets/appointment_details_card.dart';
import 'package:carwashapp/features/progress/progress/progress_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/media_query_utils.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Static data for the appointment
    // String appointmentId = "123456"; // Static appointment ID
    String? title = AuthenticationBloc.user.appointment!.services!.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(color: ColorsManager.primary),
        ),
        centerTitle: true,
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
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UpdatindDataState) {
                  return Skeletonizer(
                    child: AppointmentDetailsCard(
                        date:
                            "${AuthenticationBloc.user.appointment!.time!}, ${AuthenticationBloc.user.appointment!.date!}",
                        location: AuthenticationBloc
                            .user.appointment!.address!.address!,
                        paymentMethod: AuthenticationBloc
                            .user.appointment!.paymentMethod!),
                  );
                } else {
                  return AppointmentDetailsCard(
                      date:
                          "${AuthenticationBloc.user.appointment!.time!}, ${AuthenticationBloc.user.appointment!.date!}",
                      location: AuthenticationBloc
                          .user.appointment!.address!.address!,
                      paymentMethod:
                          AuthenticationBloc.user.appointment!.paymentMethod!);
                }
              },
            ),
            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.04),
            ),

            // Display the QR code image
            Center(
              child: Image.asset(
                getServicePlanImage(AuthenticationBloc.user.appointment!
                    .services!.title!), // Path to your asset image
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressTrackerScreen(
                                title: title,
                                price: AuthenticationBloc
                                    .user.appointment!.services!.price!,
                                isUpdate: true,
                              )));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditAppointmentScreen(
                  //       initialDate: AuthenticationBloc.user.appointment!.date!,
                  //       initialTime: AuthenticationBloc.user.appointment!.time!,
                  //       initialLocation:
                  //           AuthenticationBloc.user.address!.address!,
                  //       initialPaymentMethod:
                  //           AuthenticationBloc.user.appointment!.paymentMethod!,
                  //     ),
                  //   ),
                  // );
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
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return SizedBox(
                  width: MediaQueryUtils.getScreenWidth(
                      context), // Full width of the screen
                  height: MediaQueryUtils.getHeightPercentage(context, 0.06),
                  child: OutlinedButton(
                    onPressed: () {
                      showAlertDialog(
                        context: context,
                        txt: 'Cancel',
                        okOnPressed: () {
                          // Handle cancel appointment
                          AuthenticationBloc.user.appointment =
                              AppointmentModelAuth.toInitial();
                          context.read<UserBloc>().add(BookAppointementEvent());
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreenBody()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Your Appointment is Canceled')),
                          );
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text('Cancel Appointment'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String servicePlan = AuthenticationBloc.user.appointment!.services!.title!;
String getServicePlanImage(String servicePlan) {
  if (servicePlan == 'Standard Wash') {
    return 'assets/images/Standard.png';
  } else if (servicePlan == 'Deluxe Wash') {
    return 'assets/images/Deluxe.png';
  } else {
    return 'assets/images/Premium.png';
  }
}
