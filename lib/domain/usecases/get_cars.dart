import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/domain/repositories/car_repo.dart';

class GetCars{
  final CarRepo carRepo;
  GetCars(this.carRepo);

  Future<List<Car>> call() async{
    return await carRepo.fetchCars();
  }
}
