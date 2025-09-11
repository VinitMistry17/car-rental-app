import 'package:car_rental_app/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;
  FirebaseCarDataSource(this.firestore);

  Future<List<Car>> getCars() async{
    var snapShot = await firestore.collection('cars').get();
    return snapShot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
