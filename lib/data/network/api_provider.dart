import 'dart:convert';
import 'package:amaliy/data/models/pokemon_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:http/http.dart' as http;
class ApiProvider {
  static Future<UniversalData> getPokemon() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: PokemonModel.fromJson(jsonDecode(response.body)['pokemon'][0]));
      }

      return UniversalData(error: "Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}