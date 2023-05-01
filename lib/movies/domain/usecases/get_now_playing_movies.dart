import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMovies {
  BaseMovieRepositroty baseMovieRepositroty;

  GetNowPlayingMovies(this.baseMovieRepositroty);

  Future<Either<GeneralError, List<Movie>>> execute() =>
      baseMovieRepositroty.getNowPlayingMovies();
}
