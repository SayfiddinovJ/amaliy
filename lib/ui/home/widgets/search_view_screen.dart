import 'package:flutter/material.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({
    required this.suggestionList,
    required this.id,
  });
  List<int?> id;

  final List<String> suggestionList;

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
      children: List.generate(
        suggestions.length,
            (index) => ListTile(
              title: Text(suggestions[index],style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),),
              onTap: (){
                query = suggestions[index];
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen(name: suggestions[index], phone: phoneNumber[index], id: id[index]!,surName: surName[index],),),);
              },
            ),
      ),
    );
  }
}