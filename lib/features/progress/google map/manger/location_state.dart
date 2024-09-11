import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// State
class LocationState extends Equatable {
  final Position? currentPosition;
  final String? currentAddress;
  final Set<Marker> markers;
  final String? error;

  const LocationState({
    this.currentPosition,
    this.currentAddress,
    this.markers = const {},
    this.error,
  });

  LocationState copyWith({
    Position? currentPosition,
    String? currentAddress,
    Set<Marker>? markers,
    String? error,
  }) {
    return LocationState(
      currentPosition: currentPosition ?? this.currentPosition,
      currentAddress: currentAddress ?? this.currentAddress,
      markers: markers ?? this.markers,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [currentPosition, currentAddress, markers, error];
}

// Cubit
