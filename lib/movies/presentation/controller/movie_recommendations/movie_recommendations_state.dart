part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

class MovieRecommendationsLoading extends MovieRecommendationsState {}

class MovieRecommendationsSuccess extends MovieRecommendationsState {
  final List<Movie> recommendations;

  const MovieRecommendationsSuccess({required this.recommendations});

  @override
  List<Object> get props => [recommendations];
}

class MovieRecommendationsError extends MovieRecommendationsState {
  final GeneralError remoteDatasourceError;

  const MovieRecommendationsError({required this.remoteDatasourceError});

  @override
  List<Object> get props => [remoteDatasourceError];
}
