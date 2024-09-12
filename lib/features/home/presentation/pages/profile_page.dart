import 'package:carwashapp/core/constants/routes.dart';
import 'package:carwashapp/core/utils/media_query_utils.dart';
import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_events.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_states.dart';
import 'package:carwashapp/features/home/presentation/pages/about_us_page.dart';
import 'package:carwashapp/features/home/presentation/pages/profile_edit_screen.dart';
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
        leading: const SizedBox(),
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        builder: (BuildContext context, AuthenticationStates state) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.018),
              ),
              const ProfileDetails(),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.008),
              ),
              const Divider(),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.008),
              ),
              Text(
                'Car type',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.009),
              ),
              const ChangeCarType(),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.030),
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryUtils.getHeightPercentage(context, 0.008),
              ),
              Expanded(
                  child: ListView(children: [
                SettingsItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          currentName: AuthenticationBloc.user.name!,
                          currentEmail: AuthenticationBloc.user.email!,
                          currentCarType:
                              AuthenticationBloc.user.appointment!.carType!,
                          currentProfileImageUrl:
                              AuthenticationBloc.user.imageUrl!,
                        ),
                      ),
                    );
                  },
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsPage()));
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
