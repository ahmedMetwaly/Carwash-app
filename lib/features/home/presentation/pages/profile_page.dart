import 'package:carwashapp/core/constants/routes.dart';
import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_events.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../widgets/change_car_type.dart';
import '../widgets/profile_details_item.dart';
import '../widgets/settings_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black38,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        builder: (BuildContext context, AuthenticationStates state) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const ProfileDetails(),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Car type',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const ChangeCarType(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(children: [
                const SettingsItem(
                  leading: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  title: 'Edit Profile',
                ),
                const SettingsItem(
                  leading: Icon(
                    Icons.payment_rounded,
                    color: Colors.white,
                  ),
                  title: 'Payment Information',
                ),
                const SettingsItem(
                  leading: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  title: 'Loyalty Club',
                ),
                SettingsItem(
                  leading: const Icon(
                    Icons.more,
                    color: Colors.white,
                  ),
                  title: 'about us',
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
                SettingsItem(
                  onTap: () =>
                      context.read<AuthenticationBloc>().add(SignOutEvent()),
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  title: 'Logout',
                ),
              ]))
            ],
          ),
        ),
        listener: (BuildContext context, AuthenticationStates state) {
          if (state is AuthLogedOutState) {
            Navigator.pushReplacementNamed(context, Routes.logIn);
          }
        },
      ),
    );
  }
}
