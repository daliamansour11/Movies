import 'package:flutter/material.dart';
import 'package:movies/models/Movie.dart';






class DetailsScreen extends StatefulWidget {
  String? tittle;
  DateTime? releaseDate;
  double? voteAverage;
  String? overview;
  String? image;
  bool?adult;
  DetailsScreen({
    this.tittle,
    this.releaseDate,
    this.overview,
    this.voteAverage,
    this.image,
    this.adult,
  }) ;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
  // final args = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          children :[
            SizedBox(height: 20,),
            Text(widget.tittle.toString()),
            SizedBox(height: 20,),

            Text(widget.releaseDate.toString()),
            SizedBox(height: 20,),

            Text(widget.voteAverage.toString()),
            SizedBox(height: 20,),

            Text(widget.overview.toString()),
            SizedBox(height: 20,),

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.black12,

                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image??""))
              ),
            ),

          ],
        ),
      ),
    );
  }
}
