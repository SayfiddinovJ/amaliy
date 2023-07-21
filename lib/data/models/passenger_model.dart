import 'package:amaliy/data/models/airlane_model.dart';

class PassengerModel{
  final String name;
  final AirlineModel airlineModel;

  PassengerModel({
    required this.name,
    required this.airlineModel,
  });

  factory PassengerModel.fromJson(Map<String, dynamic> json){
    print('data passenger');
    return PassengerModel(
        name: json['name'],
        airlineModel: json['airline'][0]
    );
  }
}