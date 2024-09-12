import 'package:flutter/material.dart';

import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../pages/appointment_screen.dart';

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
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReceiptScreen()));
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        minTileHeight: 90,
        leading: Image.asset(
          'assets/images/Standard.png',
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          '${AuthenticationBloc.user.appointment!.date!} - ${AuthenticationBloc.user.appointment!.time!}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '🗺️ ${AuthenticationBloc.user.address!.address}',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReceiptScreen()));
          },
          icon: Icon(
            Icons.chevron_right_rounded,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
