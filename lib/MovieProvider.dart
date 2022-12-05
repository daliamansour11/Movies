import 'package:flutter/cupertino.dart';
import 'package:movies/service/MoviesRepository.dart';

import 'models/Movie.dart';


class MovieProvider extends ChangeNotifier{
  List<Movie>? movies ;
  MoviesReopsitory movieReopsitory = MoviesReopsitory();


  MovieProvider(){
    getMovie();
  }

  void getMovie(){
    movieReopsitory.fetchMovies().then(
            (value) {
          movies = value;
          notifyListeners();
        });
  }
}