import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/core/exeptions/remote_datasource_exception.dart';
import 'package:clean_architecture_movies_app/movies/data/datasource/movies_remote_datasource.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository implements BaseMovieRepositroty {
  BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;

  MoviesRepository(this.baseMoviesRemoteDatasource);

  @override
  Future<Either<GeneralError, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDatasource.getMovies('now_playing');
    try {
      return Right(result);
    } on RemoteDatasourceException catch (remoteDatasourceException) {
      return Left(remoteDatasourceException.remoteDatasourceError);
    }
  }

  @override
  Future<Either<GeneralError, List<Movie>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDatasource.getMovies('popular');
    try {
      return Right(result);
    } on RemoteDatasourceException catch (remoteDatasourceException) {
      return Left(remoteDatasourceException.remoteDatasourceError);
    }
  }

  @override
  Future<Either<GeneralError, List<Movie>>> getTopRatedMoviews() async {
    final result = await baseMoviesRemoteDatasource.getMovies('top_rated');
    try {
      return Right(result);
    } on RemoteDatasourceException catch (remoteDatasourceException) {
      return Left(remoteDatasourceException.remoteDatasourceError);
    }
  }
  
  @override
  Future<Either<GeneralError, MovieDetails>> getMovieById(int movieId) async {
    final result = await baseMoviesRemoteDatasource.getMovieById(movieId);
    try {
      return Right(result);
    } on RemoteDatasourceException catch (remoteDatasourceException) {
      return Left(remoteDatasourceException.remoteDatasourceError);
    }
  }

  @override
  Future<Either<GeneralError, List<Movie>>> getMovieRecommendationsById(int movieId) async {
    final result = await baseMoviesRemoteDatasource.getMovieRecommendationById(movieId);
    try {
      return Right(result);
    } on RemoteDatasourceException catch (remoteDatasourceException) {
      return Left(remoteDatasourceException.remoteDatasourceError);
    }
  }
}
