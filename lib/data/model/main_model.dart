
import 'package:amaliy/data/model/result_model.dart';

class MainModel{
  final List<ResultModel> result;
  MainModel({
    required this.result,
  });
  factory MainModel.fromJson(Map<String, dynamic> json){
    print('Response');
    return MainModel(result: (json["results"] as List?)
        ?.map((e) => ResultModel.fromJson(e))
        .toList() ?? [],
    );
  }
}