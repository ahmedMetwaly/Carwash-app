import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../data/models/address/address_model.dart';
import '../auth_bloc/auth_bloc.dart';
import 'address_states.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitialState());
  void pickAddress(String address, String url, bool fromBookAppointment) {
    emit(AddressLoadingState());
    print("Place picked");
    if (fromBookAppointment) {
      AuthenticationBloc.user.appointment!.address = AddressModel(
        address: address,
        addressUrl: url,
      );
    } else {
      AuthenticationBloc.user.address = AddressModel(
        address: address,
        addressUrl: url,
      );
    }
    emit(AddressSucssesState());
  }

  Future checkPermession() async {
    bool serviceEnabled;
    final locationController = Location();
    PermissionStatus permissionGranted;
    try {
      emit(AddressLoadingState());
      serviceEnabled = await locationController.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await locationController.requestService();
        if (!serviceEnabled) {
          emit(AddressPermessionDenied());
          return;
        } else {
          emit(AddressPermessionApproved());
        }
      }
      permissionGranted = await locationController.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await locationController.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          emit(AddressPermessionDenied());

          return;
        } else {
          emit(AddressPermessionApproved());
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
