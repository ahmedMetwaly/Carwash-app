import 'package:flutter/material.dart';

import '../../../auth/controller/auth_bloc/auth_bloc.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Card(
      shadowColor: primaryColor,
      color: Colors.white,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        minTileHeight: 90,
        leading: Image.asset(
          'assets/images/Standard.png',
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          '${AuthenticationBloc.user.appointement!.date!} - ${AuthenticationBloc.user.appointement!.time!}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '🗺️ ${AuthenticationBloc.user.address!.address}',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_rounded,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
