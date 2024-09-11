

abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class LoadingSettings extends SettingsStates {}

class SettingsError extends SettingsStates {
  final String errorMsg;

  SettingsError({required this.errorMsg});
}

class SettingsLoadedSuccessfully extends SettingsStates{
  final bool?isOpenedBefore;
  final bool? isDark;
  final String? language;
  SettingsLoadedSuccessfully({this.isOpenedBefore, this.isDark , this.language});
}
