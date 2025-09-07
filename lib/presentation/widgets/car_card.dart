import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({
    required this.car,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
        MaterialPageRoute(builder: (con) => CarDetailsPage(car: car,))
      ),
      child: Container(
        // Outer spacing for the card
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // Inner spacing within the card
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light background color
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // Soft shadow color
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
          children: [
            // Car Image
            Image.asset(
              'assets/images/mercedes1.png',
              height: 120,
            ),
            SizedBox(height: 10),
      
            // Car Model Name
            Text(
              car.model,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
      
            // Car details: distance, fuel capacity, price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Distance info
                Row(
                  children: [
                    Image.asset(
                      'assets/images/send.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 5),
                    Text('${car.distance.toStringAsFixed(0)} km'),
                  ],
                ),
      
                // Fuel capacity info
                Row(
                  children: [
                    Image.asset(
                      'assets/images/gas-station.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 5),
                    Text('${car.fuelCapacity.toStringAsFixed(0)}L'),
                  ],
                ),
      
                // Price per hour
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
