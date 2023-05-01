import 'package:clean_architecture_movies_app/core/constants/api_constants.dart';
import 'package:clean_architecture_movies_app/core/exeptions/remote_datasource_exception.dart';
import 'package:clean_architecture_movies_app/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

abstract class BaseMoviesRemoteDatasource {
  Future<List<MovieModel>> getMovies(String endPoint);
}

class MoviesRemoteDatasource implements BaseMoviesRemoteDatasource {
  @override
  Future<List<MovieModel>> getMovies(String endpoint) async {
    String url = '$baseUrl/movie/$endpoint?api_key=$apiKey';
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((json) => MovieModel.fromJson(json)));
    } else {
      throw RemoteDatasourceException(
          RemoteDatasourceError.fromJson(response.data));
    }
  }
}
