
import 'package:movies/models/Movie.dart';

import 'MoviesApiService.dart';

  class MoviesReopsitory{
     List<Movie>? movies =[];
    MoviesApiService moviesApiService = MoviesApiService();

  Future<List<Movie>>fetchMovies() async{

    return  moviesApiService.fetchMovies();

  }
  }

