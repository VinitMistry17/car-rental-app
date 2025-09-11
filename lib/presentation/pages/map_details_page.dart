import 'package:car_rental_app/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailsPage extends StatelessWidget {
  final Car car;

  const MapDetailsPage({required this.car, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              //The starting location of the map, here it's set to London
              initialCenter: LatLng(22.3072, 73.1812),
              //initialZoom: How zoomed-in the map should be, here it's set to 13.0 (which is moderately zoomed).
              initialZoom: 13.0,
            ),
            children: [
              //The TileLayer is what loads the actual map tiles (images).
              TileLayer(
                //urlTemplate: The URL template used to fetch map tiles from OpenStreetMap.
                /*
                  {s}, {z}, {x}, {y} are placeholders:

                  {s} = subdomain ('a', 'b', 'c')

                  {z} = zoom level

                  {x}, {y} = coordinates of the tile
                 */
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                //subdomains: Helps distribute the requests across different servers ('a', 'b', 'c').
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          // Bottom card showing car details wrapped in SingleChildScrollView to prevent overflow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea( // Ensures it doesn't go into notches or bottom bars
              child: SingleChildScrollView( // Scroll if space is less
                child: CarDetailsCard(car: car),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget to display car details card at the bottom of the map
Widget CarDetailsCard({required Car car}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        // Main dark container with car info
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '${car.model}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Car specifications row
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '> ${car.distance} km',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.battery_full, color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    '${car.fuelCapacity.toString()} L',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        // White bottom section with features and booking
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Features',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                featureIcons(),
                const SizedBox(height: 20),
                // Price and book button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${car.pricePerHour}/day',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Car image positioned on the right side with better styling
        Positioned(
          top: 30, // Moved slightly lower for better balance
          right: 1, // More padding from right edge
          child: Container(
            // Add container for better car image presentation
            decoration: BoxDecoration(
              // Subtle shadow behind car image for depth
            ),
            child: Transform.scale(
              scale: 1, // Scale down car image to fit better
              child: Image.asset(
                'assets/white_car.webp',
                width: 220, // Set specific width for consistent sizing
                height: 150, // Set specific height for consistent sizing
                fit: BoxFit.contain, // Maintain aspect ratio
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Widget to create row of feature icons
Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0-100km/s'),
      featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
    ],
  );
}

// Widget to create individual feature icon with title and subtitle
// FIXED: Changed to use Expanded within Column to prevent overflow
Widget featureIcon(IconData icon, String title, String subtitle) {
  return Container(
    padding: const EdgeInsets.all(5),
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      // Center align items in feature box
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24), // Slightly reduced icon size from 28 to 24
        const SizedBox(height: 2), // Reduced spacing from 4 to 2
        // FIXED: Wrapped Text widgets in Flexible to prevent overflow
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500, // Make title slightly bolder
              fontSize: 12, // Explicitly set font size to ensure consistency
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // Handle text overflow gracefully
            maxLines: 1, // Limit to single line
          ),
        ),
        Flexible(
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
            textAlign: TextAlign.center, // Center align subtitle text
            overflow: TextOverflow.ellipsis, // Handle text overflow gracefully
            maxLines: 1, // Limit to single line
          ),
        ),
      ],
    ),
  );
}
