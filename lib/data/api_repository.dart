import '../model/game_model.dart';
import '../model/universal_response.dart';
import 'api_provider.dart';

class GameRepository {
  final ApiProvider apiProvider;

  GameRepository({required this.apiProvider});

  Future<List<GameModel>> fetchCurrencies() async {
    UniversalResponse universalResponse = await apiProvider.getAllCurrencies();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<GameModel>;
    }
    return [];
  }
}