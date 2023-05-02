import 'package:clean_architecture_movies_app/core/base_usecase/base_usecase.dart';
import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieRecommendations
    extends BaseUseCaseWithParameters<List<Movie>, int> {
  BaseMovieRepositroty baseMovieRepositroty;

  GetMovieRecommendations(this.baseMovieRepositroty);

  @override
  Future<Either<GeneralError, List<Movie>>> call(int parameters) =>
      baseMovieRepositroty.getMovieRecommendationsById(parameters);
}
