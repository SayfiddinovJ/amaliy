import 'package:amaliy/data/models/valorant_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:amaliy/utils/app_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder<UniversalData>(
            future: ApiProvider.getPokemon(),
            builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.error.isEmpty) {
                  ValorantModel valorantModel =
                  snapshot.data!.data as ValorantModel;
                  return Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      crossAxisCount: 2,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              CachedNetworkImage(imageUrl: valorantModel.fullPortrait),
                              Text(valorantModel.displayName),
                              Text(valorantModel.developerName),
                            ],
                          ),
                        ),
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
