import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,  required this.image,required this.name, required this.company, required this.genre, required this.supportPlatforms, required this.realiseDate, required this.description, required this.link,});
  final String image;
  final String name;
  final String company;
  final String genre;
  final String supportPlatforms;
  final String realiseDate;
  final String description;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  width: 150,
                  height: 130,
                  placeholder: (context, url) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        direction: ShimmerDirection.btt,
                        period: const Duration(milliseconds: 1000),
                        child: Container(
                          width: 150,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(5),
                              color: Colors.white),
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: RichText(text: TextSpan(text: name,style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),),),
                ),

              ],
            ),
            Text('Company: $company'),
            Text('Genre: $genre'),
            Text('Support platform: $supportPlatforms'),
            Text('Release date: $realiseDate'),
            Text('Description: $description'),
            RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Link to download: ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: link,
                      style: const TextStyle(
                          color: Colors.blue,
                        ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()async{
                        await launchUrl(Uri.parse(link));
                        }
                    ),
                  ]
                )),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     const Text('Link to download: '),
            //     GestureDetector(
            //         onTap: ()async{
            //           await launchUrl(Uri.parse(link));
            //       },
            //         child: SizedBox(
            //           width: 200,
            //           child: Text(link,
            //             style: const TextStyle(color: Colors.blue),
            //             softWrap: true,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //         ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
