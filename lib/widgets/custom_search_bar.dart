import 'package:flutter/material.dart';
import 'package:ev_charging_stations_locator_fyp/providers/charging_station_provider.dart';

class CustomSearchBar extends StatelessWidget {
  final ChargingStationProvider provider;

  const CustomSearchBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: TextField(
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: 'Search by location...',
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          onChanged: (text) => provider.setSearchText(
              text.toLowerCase()), // Lowercase for case-insensitive search
        ),
      ),
    );
  }
}
