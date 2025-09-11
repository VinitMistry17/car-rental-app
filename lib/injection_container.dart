import 'package:car_rental_app/data/datasources/firebase_cardata_source.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/car_repo_impl.dart';
import 'domain/repositories/car_repo.dart';
import 'domain/usecases/get_cars.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    // Firestore instance
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

    // Data source
    getIt.registerLazySingleton<FirebaseCarDataSource>(
          () => FirebaseCarDataSource(getIt<FirebaseFirestore>()), // positional
    );

    // Repository
    getIt.registerLazySingleton<CarRepo>(
          () => CarRepoImpl(getIt<FirebaseCarDataSource>()), // positional
    );

    // Use case
    getIt.registerLazySingleton<GetCars>(
          () => GetCars(getIt<CarRepo>()), // positional
    );

    // Bloc
    getIt.registerFactory(
          () => CarBloc(getCars: getIt<GetCars>()),
    );
  } catch (e) {
    throw Exception(e);
  }
}
