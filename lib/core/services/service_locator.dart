import 'package:clean_architecture_movies_app/movies/data/datasource/movies_remote_datasource.dart';
import 'package:clean_architecture_movies_app/movies/data/repository/movies_repository.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static init() {
    getIt.registerLazySingleton<BaseMoviesRemoteDatasource>(() => MoviesRemoteDatasource());
    getIt.registerLazySingleton<BaseMovieRepositroty>(() => MoviesRepository(getIt()));
    getIt.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(getIt()));
    getIt.registerLazySingleton<GetNowPlayingMovies>(() => GetNowPlayingMovies(getIt()));
    getIt.registerLazySingleton<GetTopRatedMovies>(() => GetTopRatedMovies(getIt()));
  }
}
