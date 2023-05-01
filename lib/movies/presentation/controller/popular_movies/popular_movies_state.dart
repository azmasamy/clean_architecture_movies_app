import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<Movie> popularMovies;

  const PopularMoviesSuccess({required this.popularMovies});
}

class PopularMoviesError extends PopularMoviesState {
  final GeneralError remoteDatasourceError;
  const PopularMoviesError({required this.remoteDatasourceError});
}
