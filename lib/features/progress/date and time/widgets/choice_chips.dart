import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Functions/update_cubit_functions.dart';
import '../../../../core/utils/media_query_utils.dart';


class ChoiceChips extends StatefulWidget {
  const ChoiceChips({super.key});

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  final List<String> chipLabels = [
    '11:30 am ',
    '12:00 am ',
    '1:00 am ',
    '2:00 am ',
    '3:30 am ',
    '4:30 am ',
    '5:30 am ',
  ];
  int _selectedIndex = -1;
  String _selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryUtils.getHeightPercentage(context, 0.1),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chipLabels.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(
                    chipLabels[index],
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  selectedColor:  Theme.of(context).colorScheme.outline,
                  selected: _selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedIndex = selected ? index : -1;
                      _selectedText = selected ? chipLabels[index] : '';
                      AuthenticationBloc.user.appointement!.time = _selectedText;
                      context
                          .read<DataCubit>()
                          .updateData('screen1', _selectedText);
                    });
                    // choice is selected
                    //print(chipLabels[_selectedIndex-1].toString());
                  },
                ),
              );
            },
          ),
        ),
        // Text(
        //   "time :-    $_selectedText",
        //   style: const TextStyle(fontSize: 20),
        // ),
      ],
    );
  }
}
