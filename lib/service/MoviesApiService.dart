import 'package:movies/models/Movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MoviesApiService{
   List<Movie> Fmovie = [];
  Future<List<Movie>>fetchMovies()  async{
 var uri =Uri.parse("https://api.themoviedb.org/3/movie/550?api_key=5b96b970ad965f135d27e754ce54ac80");
 final response = await http.get(uri);


 if (response.statusCode == 200) {
   // If server returns an OK response, parse the JSON.
   var jsonResponse = json.decode(response.body);
   Movie movie =  Movie.fromJson(jsonResponse);
  Fmovie.add(movie);
   return Fmovie ;
 } else {
   // If that response was not OK, throw an error.
   throw Exception('Failed to load post');
 }
  }
  }



