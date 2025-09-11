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
        MaterialPageRoute(builder: (con) => CarDetailsPage(car: car)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Smooth dynamic car image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  _getCarImagePath(car.model),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(Icons.directions_car,
                            size: 40, color: Colors.grey[600]),
                      ),
                    );
                  },
                ),
              ),
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

  // Function to get correct image based on car model
  String _getCarImagePath(String carModel) {
    String model = carModel.toLowerCase();

    if (model.contains('mercedes')) {
      return 'assets/images/mercedes2.png';
    } else if (model.contains('bmw')) {
      return 'assets/images/bmw.png';
    } else if (model.contains('audi')) {
      return 'assets/images/audi.png';
    } else if (model.contains('tesla')) {
      return 'assets/images/tesla.png';
    }
    return 'assets/images/default_car.png';
  }
}
