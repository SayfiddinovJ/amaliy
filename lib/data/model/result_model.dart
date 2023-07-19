
import 'package:amaliy/data/model/location_model.dart';
import 'package:amaliy/data/model/login_model.dart';
import 'package:amaliy/data/model/name_model.dart';

class ResultModel{
  final NameModel name;
  final LocationModel location;
  final String email;
  final LoginModel login;
  final DobModel dob;
  final String phone;
  final PictureModel picture;
  final String nat;

  ResultModel({
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.phone,
    required this.picture,
    required this.nat,
  });


  factory ResultModel.fromJson(Map<String, dynamic> json){
    return ResultModel(
        name: NameModel.fromJson(json['name']),
        location: LocationModel.fromJson(json['location']),
        email: json['email'] ?? '',
        login: LoginModel.fromJson(json['login']),
        dob: DobModel.fromJson(json['dob']),
        phone: json['phone'] ?? '',
        picture: PictureModel.fromJson(json['picture']),
        nat: json['nat'] ?? '',
    );
  }
}

class DobModel{
  final num age;
  DobModel({required this.age});
  factory DobModel.fromJson(Map<String, dynamic> json) => DobModel(age: json['age'] ?? 0);
}

class PictureModel{
  final String large;
  PictureModel({required this.large});
  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(large: json['large'] ?? '');
}