import 'package:carwashapp/core/widgets/dialogs.dart';
import 'package:carwashapp/features/home/presentation/widgets/appointment_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import '../../../core/widgets/custom_btn.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../auth/controller/user_bloc/user_bloc.dart';
import '../../auth/controller/user_bloc/user_event.dart';
import '../../auth/controller/user_bloc/user_state.dart';
import '../../home/presentation/pages/main_page.dart';
import '../payment/stripe_payment/payment_manger.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.isUpdate});
  final String title;
  final String price;
  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DataCubit>().state;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    AuthenticationBloc.user.appointment!.services!.title = title;
    AuthenticationBloc.user.appointment!.services!.price = price;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.005),
          ),
          const Divider(
            height: 1.2,
            thickness: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: AppointmentDetailsCard(
              date:
                  "${AuthenticationBloc.user.appointment!.time!}, ${AuthenticationBloc.user.appointment!.date!}",
              location: AuthenticationBloc.user.appointment!.address!.address!,
              paymentMethod:
                  AuthenticationBloc.user.appointment!.paymentMethod!,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Price :",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$price EGP ",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Loyalty club discount :",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0 % ",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.008),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
            thickness: 1.5,
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.008),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Total :",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$price EGP ",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 23,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.02),
          ),

          // data['screen4'] == "Credit"?
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: AppTextButton(
                  buttonText: 'Book Now',
                  onPressed: () {
                    if (isUpdate == true) {
                      showAlertDialog(
                        context: context,
                        txt: 'Update',
                        okOnPressed: () {
                          context.read<UserBloc>().add(BookAppointementEvent());
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Updated Successfully')),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreenBody(),
                            ),
                          );
                        },
                      );
                      // if(AuthenticationBloc.user.)
                    } else {
                      showAlertDialog(
                        context: context,
                        txt: 'Book',
                        okOnPressed: () {
                          if (data['screen4'] == "Credit") {
                            PaymentManager.makePayment(int.parse(price), "EGP")
                                .then((val) {
                              context
                                  .read<UserBloc>()
                                  .add(BookAppointementEvent());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Booked Successfully')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreenBody(),
                                ),
                              );
                            });
                          } else {
                            context
                                .read<UserBloc>()
                                .add(BookAppointementEvent());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Booked Successfully')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeScreenBody()));
                          }
                        },
                      );
                    }
                  },
                ),
              );
            },
          )
          // : const SizedBox()
        ],
      ),
    );
  }
}
