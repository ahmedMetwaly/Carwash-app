import 'dart:async';

import 'package:carwashapp/features/auth/data/models/appointment_model/appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/user_domain/user_repo.dart';
import '../auth_bloc/auth_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialFirestore()) {
    on<ChangeProfileImageEvent>(_changeProfileImage);
    on<ChangeCarTypeEvent>(_changeCarType);
    on<BookAppointementEvent>(_bookAppointment);
  }

  late XFile profileImage;
  FutureOr<void> _changeProfileImage(
      ChangeProfileImageEvent event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      await UserRepo()
          .uploadImage(
              userId: AuthenticationBloc.user.uid ?? "0", image: profileImage)
          .then((value) {
        //print("image uploaded");
        AuthenticationBloc.user.imageUrl = value;
        return emit(UpdatedUserDataState(user: AuthenticationBloc.user));
      });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _changeCarType(
      ChangeCarTypeEvent event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      AppointmentModelAuth appointmentModel =
          AuthenticationBloc.user.appointement!;
      //     print(appointmentModel.carType);
      await UserRepo()
          .updataUserData(
              userId: AuthenticationBloc.user.uid!,
              field: "appointement",
              data: appointmentModel.toJson())
          .then((_) {
        emit(UpdatedUserDataState(user: AuthenticationBloc.user));
      });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _bookAppointment(
      BookAppointementEvent event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      AppointmentModelAuth appointmentModel =
          AuthenticationBloc.user.appointement!;
      await UserRepo()
          .updataUserData(
              userId: AuthenticationBloc.user.uid!,
              field: "appointement",
              data: appointmentModel.toJson())
          .then((_) {
        emit(UpdatedUserDataState(user: AuthenticationBloc.user));
      });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }
}
