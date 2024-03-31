import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_stations_locator_fyp/models/charging_station.dart';
import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';

import '../services/location_service.dart';

class MapScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MapScreen({Key? key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Position? _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      final locationService = LocationService();
      final position = await locationService.getCurrentLocation();
      setState(() {
        _currentPosition = position;
        _markers.add(
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(position.latitude, position.longitude),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );
      });
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15.0,
          ),
        ),
      );
    } on Exception catch (e) {
      print("Error getting location: $e");
    }
  }

  Set<Marker> _buildMarkers(List<ChargingStation> stations) {
    return stations.map((station) {
      return Marker(
        markerId: MarkerId(station.id),
        position: LatLng(station.latitude, station.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
          title: station.name,
          snippet: station.address,
        ),
        onTap: () => _onMarkerTap(station),
      );
    }).toSet();
  }

  void _onMarkerTap(ChargingStation station) {
    print("Marker tapped for station: ${station.name}");
  }

  void _goToCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    if (_currentPosition != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chargingStationProvider =
        Provider.of<ChargingStationProvider>(context);
    final filteredStations = chargingStationProvider.stations;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _currentPosition != null
                  ? LatLng(
                      _currentPosition!.latitude, _currentPosition!.longitude)
                  : const LatLng(27.7172, 85.3231),
              zoom: 13.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            markers: _markers.union(_buildMarkers(filteredStations)),
            zoomControlsEnabled: false,
            myLocationEnabled: false, // Enable zoom controls
          ),
          Positioned(
            bottom: 16.0,
            right: 165.0,
            child: FloatingActionButton(
              onPressed: _goToCurrentLocation,
              child: const Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
