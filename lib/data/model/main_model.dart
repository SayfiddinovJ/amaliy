import 'package:amaliy/data/model/data_model.dart';

class MainModel{
  final String name;
  DataModel data;
  MainModel({
    required this.name,
    required this.data,
  });
  factory MainModel.fromJson(Map<String, dynamic> json){
    return MainModel(
      name: json['name'],
      data: DataModel.fromJson(json["data"]),
    );
  }
}