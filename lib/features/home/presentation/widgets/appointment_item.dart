import 'package:flutter/material.dart';


class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Card(
      shadowColor: primaryColor,
      color: Theme.of(context).colorScheme.outline,
      child: ListTile(
        onTap: (){},
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        minTileHeight: 80,
        leading: Image.asset(
          'assets/images/مغسلة-سيارات-العباسية-.jpg',
          fit: BoxFit.fitHeight,
        ),
        title: const Text(
          'Date-Time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          '🗺️ Location',
        ),
        trailing: IconButton(
          onPressed: () {},
          icon:  Icon(
            Icons.chevron_right_rounded,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
