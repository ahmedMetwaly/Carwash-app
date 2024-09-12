import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/core/widgets/elevated_button.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_event.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:carwashapp/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:progress_tracker/progress_tracker.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';

import '../../../core/widgets/custom_button.dart';
import '../../auth/presentation/pages/signup/presentation/widgets/google_maps.dart';
import '../checkout/check_out_screen.dart';
import '../date and time/date_time_widget.dart';
import '../payment/payment_screen.dart';
import '../../../core/widgets/custom_app_bar.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen(
      {super.key, required this.servicePlan, required this.price});
  final String servicePlan;
  final String price;
  @override
  State<ProgressTrackerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<ProgressTrackerScreen> {
  final List<Status> statusList = [
    Status(name: 'Date \nand time', icon: Icons.date_range_rounded),
    Status(name: 'Location\n          ', icon: Icons.location_on_rounded),
    Status(name: ' payment \nmethod', icon: Icons.payment_outlined),
    Status(name: 'check out\n          ', icon: Icons.check_circle),
  ];

  int index = 0;

  void nextButton() {
    setState(() {
      index++;
      statusList[index].active = true;
    });
  }

  void backButton() {
    setState(() {
      index--;
      statusList[index].active = true;
    });
  }

  Widget btnWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1.2,
            thickness: 2,
            color: Colors.grey,
          ),
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.058),
                width: MediaQueryUtils.getWidthPercentage(context, 0.4),
                child: CustomButton(
                    text: "back",
                    onPressed: () =>
                        index == 0 ? Navigator.pop(context) : backButton()),
              ),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.06),
                width: MediaQueryUtils.getWidthPercentage(context, 0.4),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return CustomButton(
                        text: index == 3 ? 'booked' : "Next",
                        onPressed: () => index == 3
                            ? {
                                context
                                    .read<UserBloc>()
                                    .add(BookAppointementEvent()),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreenBody()))
                              }
                            : nextButton());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryUtils.getScreenHeight(context),
      child: BlocProvider(
        create: (context) => DataCubit(),
        child: SizedBox(
          height: MediaQueryUtils.getHeightPercentage(context, 0.6),
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: btnWidget(),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomAppBar(
                      text1:widget.servicePlan,
                      text2: index == 0
                          ? "Date and time"
                          : index == 1
                              ? "Location"
                              : index == 2
                                  ? "payment"
                                  : "checkout",
                      height: 145.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ProgressTracker(
                          currentIndex: index,
                          statusList: statusList,
                          activeColor: Theme.of(context).colorScheme.primary,
                          // Optional: Customize the color for active steps (default: Colors.green).
                          inActiveColor: Colors.grey
                          // Optional: Customize the color for inactive steps (default: Colors.grey).
                          ),
                    ),
                    const SizedBox(height: 10),
                    index == 0
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DateAndTimeScreen(),
                          )
                        : index == 1
                            ? Padding(
                                padding: const EdgeInsets.all(
                                    PaddingManager.pMainPadding),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/map_image.jpeg",
                                      height: 150,
                                    ),
                                    const SizedBox(height: 10),
                                    MyElevatedButton(
                                        title: "Select your location",
                                        onPress: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const GoogleMapPage())))
                                  ],
                                ),
                              )
                            : index == 2
                                ? const PaymentScreen()
                                // : index == 3
                                :  CheckOutScreen(
                                  price: widget.price,
                                ),
                    // : const Text("DONE"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
