class ValorantModel{
  final String displayName;
  final String developerName;
  final String fullPortrait;
  // final List<String> backgroundGradientColors;
  ValorantModel({
    required this.displayName,
    required this.developerName,
    required this.fullPortrait,
    // required this.backgroundGradientColors,
  });
  factory ValorantModel.fromJson(Map<String, dynamic>json){
    return ValorantModel(
      displayName: json['displayName'] ?? '',
      developerName: json['developerName'] ?? '',
      fullPortrait: json['displayIconSmall'] ?? '',
      // backgroundGradientColors: json['backgroundGradientColors'] ?? [],
    );
  }
}