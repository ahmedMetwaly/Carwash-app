import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../controller/shared_pref_bloc/sharedpref_state.dart';
import '../../../../../domain/shared_pref_domain/sharedprefrences_service.dart';

class SharedPrefBloc extends Cubit<SettingsStates> {
  SharedPrefBloc() : super(SettingsInitial());

  static bool isDark = false;
  bool isOpenedBefore = false;
  String lang = "en";

  Future appStarted() async {
    emit(LoadingSettings());
    try {
      await SharedPrefrencesService.getBoolValuesSF("isOpenedBefore")
          .then((value) async {
        if (value == null) {
          await SharedPrefrencesService.addBoolToSF("isDark", false);
          await SharedPrefrencesService.addStringToSF("lang", "en");
        } else {
          isOpenedBefore = true;
          await SharedPrefrencesService.getBoolValuesSF("isDark")
              .then((value) => isDark = value ?? false);
          await SharedPrefrencesService.getStringFromSF("lang")
              .then((value) => lang = value ?? "en");
        }
        //print(
        //    "isOpenBefore: $isOpenedBefore\nisDark : $isDark\nlanguage : $lang");
        emit(SettingsLoadedSuccessfully(
            isOpenedBefore: isOpenedBefore, isDark: isDark, language: lang));
      });
    } catch (error) {
      //Exception("error $error");
      emit(SettingsError(errorMsg: error.toString()));
    }
  }

  Future changeTheme(bool isDarkFunction) async {
    emit(LoadingSettings());
    try {
      isDark = isDarkFunction;
      await SharedPrefrencesService.addBoolToSF("isDark", isDarkFunction).then(
          (value) => emit(SettingsLoadedSuccessfully(isDark: isDarkFunction)));
    } catch (error) {
      //Exception("error $error");
      emit(SettingsError(errorMsg: error.toString()));
    }
  }

  Future changeLang(String language) async {
    emit(LoadingSettings());
    try {
      lang = language;
      await SharedPrefrencesService.addStringToSF("lang", language).then(
          (value) => emit(SettingsLoadedSuccessfully(language: language)));
    } catch (error) {
    //  Exception("error $error");
      emit(SettingsError(errorMsg: error.toString()));
    }
  }
}
