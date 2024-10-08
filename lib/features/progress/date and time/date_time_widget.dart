import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import 'widgets/choice_chips.dart';

class DateAndTimeScreen extends StatefulWidget {
  const DateAndTimeScreen({super.key});

  @override
  State<DateAndTimeScreen> createState() => _DateAndTimeScreenState();
}

class _DateAndTimeScreenState extends State<DateAndTimeScreen> {
  bool isSelected = false;
  DateTime today = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: MediaQueryUtils.getHeightPercentage(context, 0.6),
      child: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Select your date and time",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TableCalendar(
                weekendDays: const [
                  DateTime.friday,
                  DateTime.saturday,
                ],
                formatAnimationCurve: Curves.easeIn,
                calendarStyle: CalendarStyle(
                  // Customize the day cells
                  defaultTextStyle: TextStyle(color: Colors.black),
                  weekendTextStyle: TextStyle(color: Colors.red),
                  selectedDecoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: primaryColor),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: primaryColor),
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: today,
                onDaySelected: (selectedDay, focusedDay) async {
                  if (selectedDay.weekday != DateTime.saturday &&
                      selectedDay.weekday != DateTime.friday) {
                    setState(() {
                      _selectedDay = selectedDay;
                      AuthenticationBloc.user.appointement!.date =
                          _selectedDay.toString().split(" ")[0];
                      context.read<DataCubit>().updateData(
                          'screen2', _selectedDay.toString().split(" ")[0]);
                    });
                  }
                }),
          ),
          const Gap(20),
          const ChoiceChips(),
        ],
      ),
    );
  }
}
