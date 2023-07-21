class AirlineModel{
  final String name;
  final String country;
  final String logo;
  final String website;

  AirlineModel({
    required this.name,
    required this.country,
    required this.logo,
    required this.website,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json){
    return AirlineModel(
        name: json['name'] ?? '',
        country: json['country'] ?? '',
        logo: json['logo'] ?? '',
        website: json['website'] ?? ''
    );
  }
}