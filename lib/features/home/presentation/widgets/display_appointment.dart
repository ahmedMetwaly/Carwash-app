import 'package:carwashapp/core/utils/media_query_utils.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../auth/controller/user_bloc/user_bloc.dart';
import '../../../auth/controller/user_bloc/user_state.dart';
import 'appointment_item.dart';

class DisplayAppointment extends StatelessWidget {
  const DisplayAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (AuthenticationBloc.user.appointment!.date == "") {
          return SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.1),
            child: Center(
              child: Text("No appointments scheduled",
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          );
        } else {
          if (state is UpdatindDataState) {
            return const Skeletonizer(
              child: AppointmentItem(),
            );
          } else {
            return const AppointmentItem();
          }
        }
      },
    );
  }
}
