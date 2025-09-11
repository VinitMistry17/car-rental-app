import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_event.dart';
import 'package:car_rental_app/presentation/bloc/car_state.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart'; // ya jahan tumhara initInjection hai

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCars()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Choose Your Car',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarLoaded) {
              if (state.cars.isEmpty) {
                return const Center(
                  child: Text('No cars available'),
                );
              }
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
              );
            } else if (state is CarError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
