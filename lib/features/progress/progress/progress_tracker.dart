import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/core/widgets/elevated_button.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_event.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:carwashapp/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_tracker/progress_tracker.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import '../../../core/widgets/custom_btn.dart';

import '../../auth/presentation/pages/signup/presentation/widgets/google_maps.dart';
import '../checkout/check_out_screen.dart';
import '../date and time/date_time_widget.dart';
import '../payment/payment_screen.dart';
import 'widgets/custom_app_bar_widget.dart';

class ProgressTrackerScreen extends StatefulWidget {
  const ProgressTrackerScreen(
      {super.key, required this.title, required this.price,required  this.isUpdate});
  final String title;
  final String price;
  final bool isUpdate;
  @override
  State<ProgressTrackerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<ProgressTrackerScreen> {
  final List<Status> statuList = [
    Status(name: 'Date and time', icon: Icons.date_range_rounded),
    Status(name: 'Location', icon: Icons.location_on_rounded),
    Status(name: ' payment \nmethod', icon: Icons.payment_outlined),
    Status(name: 'check out', icon: Icons.check_circle),
  ];

  int index = 0;

  void nextButton() {
    setState(() {
      index++;
      statuList[index].active = true;
    });
  }

  void backButton() {
    setState(() {
      index--;
      statuList[index].active = true;
    });
  }

  Widget btnWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.06),
            width: MediaQueryUtils.getWidthPercentage(context, 0.4),
            child: AppTextButton(
                buttonText: "back",
                onPressed: () => index == 0
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreenBody()))
                    : backButton()),
          ),
          SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.06),
            width: MediaQueryUtils.getWidthPercentage(context, 0.4),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (BuildContext context, UserState state) => index == 3
                  ? const SizedBox()
                  : AppTextButton(
                      buttonText: "Next", onPressed: () => nextButton()),
            ),
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
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    CustomAppBar(
                      text: index == 0
                          ? "Date and time"
                          : index == 1
                              ? "Location"
                              : index == 2
                                  ? "payment"
                                  : "checkout",
                      title: widget.title,
                      height:
                          MediaQueryUtils.getHeightPercentage(context, 0.16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ProgressTracker(
                          currentIndex: index,
                          statusList: statuList,
                          activeColor: Theme.of(context).colorScheme.primary,
                          // Optional: Customize the color for active steps (default: Colors.green).
                          inActiveColor: Colors.grey
                          // Optional: Customize the color for inactive steps (default: Colors.grey).
                          ),
                    ),
                    SizedBox(
                      height:
                          MediaQueryUtils.getHeightPercentage(context, 0.010),
                    ),
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
                                    SizedBox(
                                      height:
                                          MediaQueryUtils.getHeightPercentage(
                                              context, 0.10),
                                    ),
                                    Image.asset(
                                      "assets/images/map_image.jpeg",
                                      height:
                                          MediaQueryUtils.getHeightPercentage(
                                              context, 0.18),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQueryUtils.getHeightPercentage(
                                              context, 0.10),
                                    ),
                                    MyElevatedButton(
                                        title: "Select your location",
                                        onPress: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const GoogleMapPage(fromBookAppointment: true,))))
                                  ],
                                ),
                              )
                            : index == 2
                                ? const PaymentScreen()
                                // : index == 3
                                : CheckOutScreen(
                                    title: widget.title,
                                    price: widget.price,
                                    isUpdate: widget.isUpdate,
                                  ),
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
