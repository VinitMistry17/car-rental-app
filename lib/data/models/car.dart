class Car{
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String? imageUrl;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    this.imageUrl,
  });

  factory Car.fromMap(Map<String, dynamic> map){
    return Car(
      model: map['model']?.toString() ?? 'Unknown',
      distance: (map['distance'] ?? 0).toDouble(),
      fuelCapacity: (map['fuelCapacity'] ?? 0).toDouble(),
      pricePerHour: (map['pricePerHour'] ?? 0).toDouble(),
      imageUrl: map['imageUrl']?.toString(),
    );
  }
}
