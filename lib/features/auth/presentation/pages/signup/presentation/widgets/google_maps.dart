import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io' show Platform;

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../controller/address_cubit/address_cubit.dart';
import '../../../../../controller/address_cubit/address_states.dart';
import '../../../../../controller/auth_bloc/auth_bloc.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key, required this.fromBookAppointment});
  final bool fromBookAppointment;
  @override
  Widget build(BuildContext context) {
    const kInitialPosition = LatLng(-33.8567844, 151.213108);

    return Scaffold(
      body: BlocBuilder<AddressCubit, AddressStates>(
        builder: (BuildContext context, AddressStates state) {
          return PlacePicker(
            resizeToAvoidBottomInset:
                false, // only works in page mode, less flickery
            apiKey: Platform.isAndroid
                ? googleMapsApiKeyAndroid
                : googleMapsApiKeyIos,
            hintText: S.current.findPlace,
            searchingText: S.current.pleaseWait,
            selectText: S.current.selectPlace,
            outsideOfPickAreaText: S.current.placeIsNotInArea,
            initialPosition: kInitialPosition,
            useCurrentLocation: true,
            selectInitialPosition: true,
            usePinPointingSearch: true,
            usePlaceDetailSearch: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            ignoreLocationPermissionErrors: true,
            onMapCreated: (GoogleMapController controller) async {
              print("Map created");
              await context.read<AddressCubit>().checkPermession();
            },
            onPlacePicked: (PickResult result) {
              context
                  .read<AddressCubit>()
                  .pickAddress(result.formattedAddress!, result.url!,fromBookAppointment);
              print(AuthenticationBloc.user.address!.address);
              Navigator.of(context).pop();
            },
            onMapTypeChanged: (MapType mapType) {
              print("Map type changed to ${mapType.toString()}");
            },
          );
        },
      ),
    );
  }
}
