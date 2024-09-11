import 'dart:async';
import 'package:carwashapp/features/auth/data/models/appointment_model/appointment_model.dart';
import 'package:carwashapp/features/auth/data/models/service_model/service_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/address/address_model.dart';
import '../../data/models/user/user.dart';
import '../../domain/auth_domain/authentication_service.dart';
import '../../domain/user_domain/user_repo.dart';
import 'auth_states.dart';
import 'auth_events.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<SignUpEvent>(_signUp);
    on<SignInWithEmailEvent>(_logIn);
    on<SignInWithGoogleEvent>(_loginWithGoogle);
    on<SignInWithFacebookEvent>(_loginWithFacebook);
    on<ForgetPasswordEvent>(_forgetPassword);
    on<SendEmailVerficationEvent>(_sendEmailVerfication);
    on<SignOutEvent>(_logOut);
    on<AppStarted>(_checkTheUserLogged);
  }

  static UserModel user = UserModel(
    uid: "0",
    name: S.current.guest,
    email: "",
    password: "",
    imageUrl: "",
    address: AddressModel(address: "", addressUrl: ""),
    phoneNumber: "",
    appointement: AppointmentModelAuth(
      time: "",
      carType: "",
      date: "",
      paymentMethod: "",
      services: ServicesPlan(title: "", price: "", services: []),
      address: AddressModel(address: "", addressUrl: ""),
    ),
  );

  FutureOr<void> _checkTheUserLogged(
      AppStarted event, Emitter<AuthenticationStates> emit) async {
    final userFireBase = FirebaseAuth.instance.currentUser;
    // //print("checking if the user is null or not");
    if (userFireBase != null) {
      user = await UserRepo().getUserData(userFireBase.uid);
      // //print("user found loggedIn");
      emit(AuthenticationSuccessState(user: user));
    } else {
      //print("No user");'
      emit(AuthLogedOutState());
    }
  }

  FutureOr<void> _signUp(
      SignUpEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signUp(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = UserModel(
            uid: value.uid,
            name: user.name,
            email: user.email,
            imageUrl: user.imageUrl,
            password: user.password,
            address: user.address,
            phoneNumber: user.phoneNumber,
            appointement: user.appointement,
          );
//          await FirebaseAuthService.sendEmailVerfication();
          await UserRepo().saveUserData(user).then((userData) {
            emit(LoadedState());

            emit(AuthenticationSuccessState(user: user));
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _logIn(
      SignInWithEmailEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signIn(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = await UserRepo().getUserData(value.uid ?? "0");
          emit(LoadedState());

          emit(AuthenticationSuccessState(user: user));
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _loginWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signInWithGoogle().then((userFormGoogle) async {
        //print(userFormGoogle.uid);
        if (userFormGoogle is UserModel) {
          await UserRepo()
              .getUserData(userFormGoogle.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(LoadedState());

              emit(AuthenticationSuccessState(
                  user: user,
                  authenticationPlatform: AuthenticationPlatform.google));
            } else {
              user = UserModel(
                uid: userFormGoogle.uid,
                name: userFormGoogle.name,
                email: userFormGoogle.email,
                imageUrl: userFormGoogle.imageUrl,
                password: userFormGoogle.password,
                address: user.address,
                phoneNumber: user.phoneNumber,
              );
              await UserRepo().saveUserData(user).then((userData) {
                emit(LoadedState());

                emit(AuthenticationSuccessState(
                    user: user,
                    authenticationPlatform: AuthenticationPlatform.google));
              });
            }
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(
              errorMessage: userFormGoogle.toString()));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _loginWithFacebook(
      SignInWithFacebookEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signInWithFacebook()
          .then((userFormFacebook) async {
        //print(userFormFacebook.uid);
        if (userFormFacebook is UserModel) {
          await UserRepo()
              .getUserData(userFormFacebook.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(LoadedState());

              emit(AuthenticationSuccessState(
                  user: user,
                  authenticationPlatform: AuthenticationPlatform.facebook));
            } else {
              user = UserModel(
                uid: userFormFacebook.uid,
                name: userFormFacebook.name,
                email: userFormFacebook.email,
                imageUrl: userFormFacebook.imageUrl,
                password: userFormFacebook.password,
                address: user.address,
                phoneNumber: user.phoneNumber,
              );
              await UserRepo().saveUserData(user).then((userData) {
                emit(LoadedState());

                emit(AuthenticationSuccessState(
                    user: user,
                    authenticationPlatform: AuthenticationPlatform.facebook));
              });
            }
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(
              errorMessage: userFormFacebook.toString()));
        }
      });
    } catch (error) {
      //print(error.toString());
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _forgetPassword(
      ForgetPasswordEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(AuthinticationLoadingState());
      await FirebaseAuthService.forgotPassword(user.email ?? "").then((value) {
        if (value == true) {
          emit(LoadedState());

          emit(ForgetPasswordEmailSentState(
              email: AuthenticationBloc.user.email ?? ""));
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _logOut(
      SignOutEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    await FirebaseAuthService.logOut();

    emit(LoadedState());

    emit(AuthLogedOutState());
  }

  FutureOr<void> _sendEmailVerfication(SendEmailVerficationEvent event,
      Emitter<AuthenticationStates> emit) async {
    try {
      await FirebaseAuthService.sendEmailVerfication().then((value) {
        if (value == true) {
          emit(EmailVerficationSentState(
              email: AuthenticationBloc.user.email ?? ""));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }
}
