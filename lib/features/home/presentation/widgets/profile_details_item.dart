import 'package:carwashapp/core/utils/values.dart';
import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'change_profile_pic.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChangeProfileImageWidget(),
        const SizedBox(width: SizeManager.sSpace16),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AuthenticationBloc.user.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Personal Use',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
