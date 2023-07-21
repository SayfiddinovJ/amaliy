import 'package:amaliy/data/models/passenger_model.dart';

class DataModel{
  final List<PassengerModel> data;
  DataModel({
    required this.data,
  });
  factory DataModel.fromJson(Map<String, dynamic>json){
    print('data model');
    return DataModel(
      data: List<PassengerModel>.from(json["data"].map((e) => PassengerModel.fromJson(e))),
    );
  }
}