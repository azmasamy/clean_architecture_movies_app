part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsEvent extends Equatable {
  const MovieRecommendationsEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieRecommendations extends MovieRecommendationsEvent {
  final int movieId;

  const LoadMovieRecommendations(this.movieId);

  @override
  List<Object> get props => [movieId];
}
