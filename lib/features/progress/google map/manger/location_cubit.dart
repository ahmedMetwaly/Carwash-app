/* import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/Functions/update_cubit_functions.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final DataCubit dataCubit;

  LocationCubit(this.dataCubit) : super(const LocationState());

  Future<void> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(error: 'Location services are disabled'));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(error: 'Location permission denied'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(
          state.copyWith(error: 'Location permissions are permanently denied'));
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      emit(state.copyWith(currentPosition: position));

      // Add marker at current position
      Set<Marker> newMarkers = {
        Marker(
          markerId: MarkerId('currentPosition'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: 'Current Position'),
        ),
      };

      emit(state.copyWith(markers: newMarkers));

      // Get address from coordinates and update DataCubit
      await getAddressFromLatLng(position);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      String address =
          "${place.street}${place.administrativeArea}, ${place.country}";
      emit(state.copyWith(currentAddress: address));
      dataCubit.updateData(
          'currentAddress', address); // Update DataCubit with the address
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void onMapTapped(LatLng position) async {
    Set<Marker> newMarkers = {
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
      ),
    };

    emit(state.copyWith(markers: newMarkers));

    Position tappedPosition = Position(
      latitude: position.latitude,
      longitude: position.longitude,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      altitudeAccuracy: 1,
      heading: 1,
      headingAccuracy: 1,
      speed: 1,
      speedAccuracy: 1,
    );

    await getAddressFromLatLng(tappedPosition);
  }
}
 */