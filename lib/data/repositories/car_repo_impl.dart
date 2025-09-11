import 'package:car_rental_app/data/datasources/firebase_cardata_source.dart';
import 'package:car_rental_app/domain/repositories/car_repo.dart';

import '../models/car.dart';

class CarRepoImpl implements CarRepo{
  final FirebaseCarDataSource dataSource;
  CarRepoImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
   return dataSource.getCars();
  }
}
