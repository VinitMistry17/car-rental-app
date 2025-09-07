import 'package:car_rental_app/data/models/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({
    required this.car,super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //container ke bahar space
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      //container ke andar space
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200] ,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ]
      ),
      child: Column(
        children: [
          Image.asset('assets/images/mercedes1.png',height: 120,),
          Text(car.model,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // दोनों को अलग‑अलग किनारों पर रखेगा
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/send.png', width: 20, height: 20), // size कम कर दिया
                      SizedBox(width: 5), // image और text के बीच gap
                      Text('${car.distance.toStringAsFixed(0)} km'),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/gas-station.png', width: 20, height: 20), // size कम कर दिया
                      SizedBox(width: 5),
                      Text('${car.fuelCapacity.toStringAsFixed(0)} L'),
                    ],
                  ),
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}
