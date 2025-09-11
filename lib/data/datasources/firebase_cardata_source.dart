import 'package:car_rental_app/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;
  FirebaseCarDataSource(this.firestore);

  Future<List<Car>> getCars() async{
    try {
      print('Fetching cars from Firestore...');
      var snapShot = await firestore.collection('cars').get();
      print('Found ${snapShot.docs.length} documents');

      final cars = snapShot.docs.map((doc) {
        print('Car data: ${doc.data()}');
        return Car.fromMap(doc.data());
      }).toList();

      print('Converted ${cars.length} cars');
      return cars;
    } catch (e) {
      print('Error fetching cars: $e');
      rethrow;
    }
  }
}
