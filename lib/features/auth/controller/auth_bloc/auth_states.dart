
import '../../../../core/constants/constants.dart';
import '../../data/models/user/user.dart';

abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}

class AuthinticationLoadingState extends AuthenticationStates {}
class LoadedState extends AuthenticationStates {}

class AuthenticationSuccessState extends AuthenticationStates {
  final UserModel user;
  final AuthenticationPlatform? authenticationPlatform;
  AuthenticationSuccessState(
      {required this.user,  this.authenticationPlatform});
}

class AuthenticationFailedState extends AuthenticationStates {
  final String errorMessage;
  AuthenticationFailedState({required this.errorMessage});
}

class ForgetPasswordEmailSentState extends AuthenticationStates {
  final String email;
  ForgetPasswordEmailSentState({required this.email});
}

class EmailVerficationSentState extends AuthenticationStates {
  final String email;
  EmailVerficationSentState({required this.email});
}

class AuthLogedOutState extends AuthenticationStates {}
