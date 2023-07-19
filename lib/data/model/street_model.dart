class StreetModel{
  final num number;
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json){
    return StreetModel(number: json['number'] ?? 0, name: json['name'] ?? '');
  }
}