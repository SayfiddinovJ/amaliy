import 'package:amaliy/data/model/street_model.dart';

class LocationModel{
  final StreetModel street;
  final String city;
  final String state;
  final String country;

  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });
  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
        street: StreetModel.fromJson(json['street']),
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
    );
  }
}