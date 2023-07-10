import 'package:amaliy/ui/detail/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameSearchView extends SearchDelegate {
  GameSearchView({
    required this.imageList,
    required this.suggestionList,
    required this.id,
    required this.company,
    required this.genre,
    required this.supportPlatforms,
    required this.realiseDate,
    required this.description,
    required this.link,
  });
  final List<int?> id;
  final List<String> suggestionList;
  final List<String> imageList;
  final List<String> company;
  final List<String> genre;
  final List<String> supportPlatforms;
  final List<String> realiseDate;
  final List<String> description;
  final List<String> link;


  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(Icons.close),
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, query);
    },
  );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView(
      padding: const EdgeInsets.all(10),
      children: List.generate(
        suggestions.length,
            (index) => GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                    image: imageList[index],
                    name: suggestions[index],
                    company: company[index],
                    genre: genre[index],
                    supportPlatforms: supportPlatforms[index],
                    realiseDate: realiseDate[index],
                    description: description[index],
                    link: link[index])));
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: imageList[index],
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                    Text(suggestions[index],style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}