import 'package:adaptive_theme/adaptive_theme.dart' as detail_screen;
import 'package:amaliy/data/model/main_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {});
            },
            icon: const Icon(Icons.refresh,color: Colors.white,),
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getUser(),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              MainModel mainModel =
              snapshot.data!.data as MainModel;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                    Center(
                      child: Text(mainModel.name)
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text(snapshot.data!.error),
            );
          }

          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
