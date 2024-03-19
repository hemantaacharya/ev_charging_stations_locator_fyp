import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/station_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;

  // Initial camera position for the map
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(27.7172, 85.324),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: _getMarkers(),
      ),
    );
  }

  // Function to create markers for charging stations
  Set<Marker> _getMarkers() {
    return StationData.chargingStations.map((station) {
      return Marker(
        markerId: MarkerId(station.name),
        position: LatLng(station.latitude, station.longitude),
        infoWindow: InfoWindow(
          title: station.name,
          snippet: station.address,
        ),
      );
    }).toSet();
  }
}
