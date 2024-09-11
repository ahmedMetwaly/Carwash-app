/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../manger/location_cubit.dart';
import '../manger/location_state.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  CameraPosition routeCameraPosition = const CameraPosition(
    target: LatLng(30.0445989, 31.2237872),
    zoom: 17,
  );
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: routeCameraPosition,
                    mapType: MapType.hybrid,
                    markers: state.markers,
                    myLocationButtonEnabled: true,
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    onTap: (position) {
                      context.read<LocationCubit>().onMapTapped(position);
                    },
                  );
                },
              ),
            ),
            if (context.watch<LocationCubit>().state.currentAddress != null)
              Card(
                margin: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.red),
                  title: Text(
                    context.watch<LocationCubit>().state.currentAddress!,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Your current location'),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.my_location,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () async {
            context.read<LocationCubit>().getCurrentPosition();
            final position =
                context.read<LocationCubit>().state.currentPosition;
            if (position != null) {
              mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
 */