import 'package:amaliy/models/times_model.dart';

class RegionModel{
  final String region;
  final String date;
  final String weekday;
  final TimesModel timesModel;
  RegionModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.timesModel,
  });
  factory RegionModel.fromJson(Map<String,dynamic> json){
    return RegionModel(
        region: json['region'] as String? ?? '',
        date: json['date'] as String? ?? '',
        weekday: json['weekday'] as String? ?? '',
        timesModel: TimesModel.fromJson(json['times']),
    );
  }
}