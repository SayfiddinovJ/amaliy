import 'package:amaliy/ui/detail/detail_screen.dart';
import 'package:amaliy/ui/home/widgets/search_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/api_provider.dart';
import '../../data/api_repository.dart';
import '../../model/game_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GameRepository gameRepository =
  GameRepository(apiProvider: ApiProvider());
  List<GameModel> games = [];
  List<GameModel> allGames = [];
  String searchText = "";
  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    allGames = await gameRepository.fetchCurrencies();
    print("CURRENCY FETCH FINISHED:${allGames.length}");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Games"),
        actions: [
          IconButton(onPressed: () async {
            searchText = await showSearch(
              context: context,
              delegate: GameSearchView(
                suggestionList: allGames.map((e) => e.title).toList(),
                id: allGames.map((e) => e.id).toList(),
                imageList: allGames.map((e) => e.thumbnail).toList(),
                company: allGames.map((e) => e.publisher).toList(),
                genre: allGames.map((e) => e.genre).toList(),
                supportPlatforms: allGames.map((e) => e.platform).toList(),
                realiseDate: allGames.map((e) => e.releaseDate).toList(),
                description: allGames.map((e) => e.shortDescription).toList(),
                link: allGames.map((e) => e.gameUrl).toList(),
              ),
            );
            if(searchText.isNotEmpty) _getGamesByQuery(searchText);
            debugPrint("RESULT:$searchText");
            }, icon: const Icon(Icons.search)),
        ],
      ),
      body: isLoading
          ? const Center(
             child: CircularProgressIndicator(),
      )
          : allGames.isEmpty
          ? const Center(child: Text("Error connection"))
          : Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: [ListView(
                  padding: const EdgeInsets.all(10),
                  children: List.generate(
                    allGames.length,
                        (index){
                      GameModel games = allGames[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(
                                        image: games
                                            .thumbnail,
                                        name:
                                        games.title,
                                        company: games
                                            .publisher,
                                        genre:
                                        games.genre,
                                        supportPlatforms:
                                        games
                                            .platform,
                                        realiseDate:
                                        games
                                            .releaseDate,
                                        description: games
                                            .shortDescription,
                                        link: games
                                            .gameUrl,
                                      )));
                          },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  games.thumbnail,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: 200,
                                ),
                              ),
                              Text(
                                games.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ),],
              ),
              Expanded(
                child: ListView(
        children: List.generate(
                allGames.length,
                    (index) {
                  GameModel game = allGames[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(image: game.thumbnail, name: game.title, company: game.publisher, genre: game.genre, supportPlatforms: game.platform, realiseDate: game.releaseDate, description: game.shortDescription, link: game.freeToGameProfileUrl)));
                    },
                    title: Text(game.title),
                    subtitle: Text(game.title),
                    trailing: const Icon(Icons.arrow_right),
                  );
                },
        ),
      ),
              ),
            ],
          ),
    );
  }
  _getGamesByQuery(String searchText){

    setState(() {});
  }
}
// Carusel slideble