import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.leading,
    required this.title,
    this.onTap, this.trailing,
  });
  final String title;
  final Widget leading;
  final void Function()? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      subtitle: trailing,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: leading,
      ),
      title: Text(title),
    );
  }
}
