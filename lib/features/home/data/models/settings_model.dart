import 'package:flutter/material.dart';

import '../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../../auth/controller/auth_bloc/auth_events.dart';

class SettingsModel {
  final Icon icon;
  final String title;
  final Function function;
  SettingsModel(
     {required this.icon, required this.title, required this.function});
}
