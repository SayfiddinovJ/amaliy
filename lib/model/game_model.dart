import 'package:hive/hive.dart';
@HiveType(typeId: 1)
class GameModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  final String shortDescription;
  @HiveField(4)
  final String gameUrl;
  @HiveField(5)
  final String genre;
  @HiveField(6)
  final String platform;
  @HiveField(7)
  final String publisher;
  @HiveField(8)
  final String developer;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final String freeToGameProfileUrl;
  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freeToGameProfileUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      thumbnail: json["thumbnail"] as String? ?? '',
      shortDescription: json["short_description"] as String? ?? '',
      gameUrl: json["game_url"] as String? ?? '',
      genre: json["genre"] as String? ?? '',
      platform: json["platform"] as String? ?? '',
      publisher: json["publisher"] as String? ?? '',
      developer: json["developer"] as String? ?? '',
      releaseDate: json["release_date"] as String? ?? '',
      freeToGameProfileUrl: json["freetogame_profile_url"] as String? ?? ''
    );
  }
}
// {
// "id": 540,
// "title": "Overwatch 2",
// "thumbnail": "https://www.freetogame.com/g/540/thumbnail.jpg",
// "short_description": "A hero-focused first-person team shooter from Blizzard Entertainment.",
// "game_url": "https://www.freetogame.com/open/overwatch-2",
// "genre": "Shooter",
// "platform": "PC (Windows)",
// "publisher": "Activision Blizzard",
// "developer": "Blizzard Entertainment",
// "release_date": "2022-10-04",
// "freetogame_profile_url": "https://www.freetogame.com/overwatch-2"
// },