import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepositroty {
  Future<Either<GeneralError, List<Movie>>> getPopularMovies();
  Future<Either<GeneralError, List<Movie>>> getNowPlayingMovies();
  Future<Either<GeneralError, List<Movie>>> getTopRatedMoviews();
}
