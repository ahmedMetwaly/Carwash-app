import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/utils/values.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../data/models/services_model.dart';
import '../widgets/appointment_item.dart';
import '../widgets/services_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.pSocialBtnVPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "${S.current.goodMorning} ${AuthenticationBloc.user.name!}",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.notifications_none,
                      size: 32, color: ColorsManager.primary),
                  onPressed: () {},
                ),
              ],
            ),
            Text(
              'A clean car is a Happy Car!',
              style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primary),
            ),
            SizedBox(height: 20.h),
            Text(
              'We offer a wide range of services at your convenience ...',
              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 60.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: servicesList.length,
                itemBuilder: (context, index) =>
                    ServicesItem(servicesItem: servicesList[index]),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Your Appointment',
              style: TextStyle(
                fontSize: 15.sp,
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
