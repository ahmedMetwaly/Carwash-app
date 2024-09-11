import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/image_from_network.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../../auth/controller/user_bloc/user_bloc.dart';
import '../../../auth/controller/user_bloc/user_event.dart';
import '../../../auth/controller/user_bloc/user_state.dart';

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        //print(state);
        if (state is UpdatindDataState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return GestureDetector(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            await picker
                .pickImage(
              source: ImageSource.gallery, // Or ImageSource.camera
            )
                .then((value) {
              if (value != null) {
                context.read<UserBloc>().profileImage = value;
                context.read<UserBloc>().add(ChangeProfileImageEvent());
              }
              return null;
            });
          },
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: ImageFromNetwork(
                imagePath: AuthenticationBloc.user.imageUrl ?? "",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ]),
        );
      },
    );
  }
}
