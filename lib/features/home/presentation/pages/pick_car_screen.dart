import 'package:carwashapp/core/utils/media_query_utils.dart';
import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/car_type.dart';
import '../widgets/save_car_type.dart';

class PickCarScreen extends StatefulWidget {
  const PickCarScreen({super.key});

  @override
  State<PickCarScreen> createState() => _PickCarScreenState();
}

class _PickCarScreenState extends State<PickCarScreen> {
  String selectedType = AuthenticationBloc.user.appointment!.carType!;
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const Padding(
            padding: EdgeInsets.all(PaddingManager.pInternalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select your car type so we can adjust our price for you!',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Car type:',
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(PaddingManager.pMainPadding),
              itemCount: carType.length,
              itemBuilder: (context, index) {
                return Card(
                  child: RadioListTile(
                    activeColor: primaryColor,
                    value: carType[index].type,
                    groupValue: selectedType,
                    title: Row(
                      children: [
                        Text(carType[index].type),
                        const Spacer(),
                        Image.asset(
                          carType[index].img,
                          height: MediaQueryUtils.getHeightPercentage(
                              context, 0.060),
                          width: MediaQueryUtils.getHeightPercentage(
                              context, 0.060),
                        ),
                      ],
                    ),
                    onChanged: (val) {
                      setState(() {
                        selectedType = val!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
            child: Column(
              children: [
                const Text(
                  'The size of the vehicle it affects the price of car washing services',
                  style: TextStyle(color: Colors.black38),
                ),
                const SizedBox(height: SizeManager.sSpace),
                SaveCarType(
                  carType: selectedType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      height: MediaQueryUtils.getHeightPercentage(context, 0.18),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pick Your Car!',
            style: TextStyle(
                fontSize: 25.0,
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/sponge_11363814.png',
            height: MediaQueryUtils.getHeightPercentage(context, 0.060),
          ),
        ],
      ),
    );
  }
}
