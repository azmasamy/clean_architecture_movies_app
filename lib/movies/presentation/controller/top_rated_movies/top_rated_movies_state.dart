part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<Movie> topRatedMovies;

  const TopRatedMoviesSuccess({required this.topRatedMovies});

              @override
  List<Object> get props => [topRatedMovies];
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final GeneralError remoteDatasourceError;
  const TopRatedMoviesError({required this.remoteDatasourceError});

              @override
  List<Object> get props => [remoteDatasourceError];
}
