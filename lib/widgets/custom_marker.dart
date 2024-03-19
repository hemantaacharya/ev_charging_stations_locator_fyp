import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatelessWidget {
  final LatLng position;

  CustomMarker({required this.position});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.map);
  }
}
