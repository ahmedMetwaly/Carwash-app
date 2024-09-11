import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/routes.dart';
import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../../auth/controller/user_bloc/user_bloc.dart';
import '../../../auth/controller/user_bloc/user_state.dart';

class ChangeCarType extends StatelessWidget {
  const ChangeCarType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) => Card(
              child: ListTile(
                minTileHeight: 75,
                leading: Image.asset(
                  'assets/images/Screenshot from 2024-09-09 21-35-31.png',
                  width: 50,
                ),
                title: Text(AuthenticationBloc.user.appointement!.carType!),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(50, 45),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.pickCar),
                  child: Text('Change',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      )),
                ),
              ),
            ));
  }
}
