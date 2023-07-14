import 'package:amaliy/data/models/pokemon_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getPokemon(),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              PokemonModel pokemonModel =
              snapshot.data!.data as PokemonModel;
              return Center(
                child: Text(pokemonModel.name),
              );
            }
          }
          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
