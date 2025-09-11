import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_event.dart';
import 'package:car_rental_app/presentation/bloc/car_state.dart';
import '../../domain/usecases/get_cars.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getCars.call(); // or await getCars.call();
        emit(CarLoaded(cars));
      } catch (e) {
        emit(CarError(e.toString()));
      }
    });
  }
}