import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies/models/Movie.dart';
import 'package:movies/service/MoviesRepository.dart';
import 'package:movies/views/Homepage/HomeScreen.dart';
import 'package:movies/views/details/DetailsScreen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


        );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  MoviesReopsitory moviesReopsitory = MoviesReopsitory();
   final image = "https://www.pngmart.com/files/5/Movie-PNG-Transparent-Image.png";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(



        backgroundColor: Colors.grey[200],
        title: Text(
          "Movies",
          style: TextStyle(color: Colors.purple,fontSize: 18, fontWeight: FontWeight.w300),
        ),


       //prefix ioc
      ),
      body: Center(
        child: FutureBuilder<List<Movie>>(
          future: moviesReopsitory.fetchMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            ;
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  double? voteAverage= snapshot.data![index].voteAverage;
                  // final movie = movieProvide.movies!.results![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () {
                         // press();
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(
                                          tittle: snapshot.data![index].title,
                                          releaseDate: snapshot.data![index]
                                              .releaseDate,
                                          voteAverage: voteAverage,
                                          overview: snapshot.data![index]
                                              .overview,
                                          image: image,
                                            adult:snapshot.data![index].adult)));
                          }
                          );
                        },
                        title: Row(
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 60,
                              child: Image.network(image),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data![index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data![index].releaseDate
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });

          },
        ),

               ));

  }
}
