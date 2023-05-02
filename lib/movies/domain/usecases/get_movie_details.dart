import 'package:clean_architecture_movies_app/core/base_usecase/base_usecase.dart';
import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetails extends BaseUseCaseWithParameters<MovieDetails, int> {
  BaseMovieRepositroty baseMovieRepositroty;

  GetMovieDetails(this.baseMovieRepositroty);

  @override
  Future<Either<GeneralError, MovieDetails>> call(int parameters) =>
      baseMovieRepositroty.getMovieById(parameters);
}
