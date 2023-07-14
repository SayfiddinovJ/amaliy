import 'package:amaliy/data/models/pokemon_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:amaliy/utils/app_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Center(
            child: SizedBox(
              height: 88,
              width: 252,
              child: Image.asset(AppIcons.logo),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 50),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFE5E5E5),
                hintText: 'Buscar Pokémon',
                hintStyle: const TextStyle(
                  color: Color(0xFF838282),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60,),
          FutureBuilder<UniversalData>(
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
                  return Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      children: [
                        ...List.generate(pokemonModel.id, (index){
                          return Stack(
                            children: [
                              Container(
                                height: 115,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFC7CFF),
                                        Color(0xFFFA5AFD),
                                      ]
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom :0,
                                child: Image.network(pokemonModel.img),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                }
              }
              return Center(
                child: Text(snapshot.error.toString()),
              );
            },
          ),
        ],
      ),
    );
  }
}
