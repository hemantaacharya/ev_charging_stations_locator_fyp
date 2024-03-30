import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatelessWidget {
  final LatLng position;

  const CustomMarker({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.map);
  }
}
