import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import '../payment/stripe_payment/payment_manger.dart';
import 'widgets/custom_row.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DataCubit>().state;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: MediaQueryUtils.getHeightPercentage(context, 0.6),
      width: MediaQueryUtils.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              " Standard wash",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1.2,
            thickness: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  CustomDataView(
                    icon: Icons.date_range_sharp,
                    dataText2:
                        AuthenticationBloc.user.appointement?.date ?? 'No data',
                    title: "Date and time :",
                    dataText:
                        AuthenticationBloc.user.appointement?.time ?? 'No data',
                  ),
                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CustomDataView(
                      icon: Icons.location_on_sharp,
                      dataText2: "",
                      title: "Location :",
                      dataText:
                          AuthenticationBloc.user.address!.address ?? 'No data',
                    ),
                  ),
                  const Gap(20),
                  CustomDataView(
                    icon: Icons.payments_rounded,
                    dataText2: "",
                    title: "Payment method :",
                    dataText: data['screen4'] ?? 'No data',
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Price :",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100  \$  ",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Loyalty club discount : :",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "0 %  ",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: Colors.grey,
                  thickness: 1.5,
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Total :",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100  \$  ",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(30),
          data['screen4'] == "Credit"
              ? CustomButton(
                  onPressed: () {
                    PaymentManager.makePayment(int.parse(price), "EGP");
                  },
                  text: '$price EGP',
                )

              // AppTextButton(
              //     buttonText: '100',
              //     onPressed: () {
              //       PaymentManager.makePayment(100, "EGP");
              //     },
              //   )
              : const SizedBox()
        ],
      ),
    );
  }
}
