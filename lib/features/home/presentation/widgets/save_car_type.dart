import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_event.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCarType extends StatelessWidget {
  const SaveCarType({
    super.key,
    required this.carType,
  });

  final String carType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) => ElevatedButton(
        onPressed: () {
          AuthenticationBloc.user.appointement!.carType = carType;
          context.read<UserBloc>().add(ChangeCarTypeEvent());
          if (state is UpdatedUserDataState) {
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: const Size(350, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: state is UpdatindDataState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                'Save',
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
      ),
    );
  }
}
