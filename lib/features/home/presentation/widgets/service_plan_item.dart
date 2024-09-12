import 'package:carwashapp/core/constants/colors_manager.dart';
import 'package:carwashapp/features/home/data/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class ServicePlanItem extends StatelessWidget {
  const ServicePlanItem(
      {super.key,
      required this.servicePlan,
      required this.img,
      required this.isSelected,
      required this.price});
  // final String servicePlan;
  final String img;
  final bool isSelected;
  final String price;
  final ServicesPlan servicePlan;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: ColorsManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected ? ColorsManager.primary : Colors.transparent,
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      img,
                      height: 45.h,
                    ),
                     SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      servicePlan.title,
                      style:  TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: ColorsManager.primary,
                        ),
                        Text(
                          servicePlan.services[0],
                          style:  TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.check_circle,
                          color: ColorsManager.primary,
                        ),
                        Text(
                          servicePlan.services[1],
                          style:  TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: ColorsManager.primary,
                        ),
                        Text(
                          servicePlan.services[2],
                          style:  TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                         Gap(5.w),
                        const Icon(
                          Icons.check_circle,
                          color: ColorsManager.primary,
                        ),
                        Text(
                          servicePlan.services[3],
                          style:  TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(
              '$price EGP',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: ColorsManager.primary),
            ),
             Gap(5.w),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: ColorsManager.primary,
            )
          ],
        ),
      ),
    );
  }
}
