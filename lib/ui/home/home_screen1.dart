import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:amaliy/data/model/main_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: mainModel.result[0].picture.large,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('Full name: ${mainModel.result[0].name.title} ${mainModel.result[0].name.first} ${mainModel.result[0].name.last}'),

                    Text('Location: ${mainModel.result[0].location.country}, ${mainModel.result[0].location.state}, ${mainModel.result[0].location.city}, ${mainModel.result[0].location.street.name}, ${mainModel.result[0].location.street.number}'),

                    Text('Email: ${mainModel.result[0].email}'),

                    Text('Username | Password: ${mainModel.result[0].login.username} | ${mainModel.result[0].login.password}'),

                    Text('Phone: ${mainModel.result[0].phone}'),

                    Text('Age: ${mainModel.result[0].dob.age}'),

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
