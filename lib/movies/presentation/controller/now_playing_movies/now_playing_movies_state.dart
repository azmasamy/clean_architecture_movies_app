part of 'now_playing_movies_bloc.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<Movie> nowPlayingMovies;

  const NowPlayingMoviesSuccess({required this.nowPlayingMovies});

        @override
  List<Object> get props => [nowPlayingMovies];
}

class NowPlayingMoviesError extends NowPlayingMoviesState {
  final GeneralError remoteDatasourceError;
  const NowPlayingMoviesError({required this.remoteDatasourceError});

      @override
  List<Object> get props => [remoteDatasourceError];
}
