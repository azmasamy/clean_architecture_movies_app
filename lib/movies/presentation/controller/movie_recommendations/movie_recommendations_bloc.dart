import 'dart:async';

import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_recommendations_event.dart';
part 'movie_recommendations_state.dart';

class MovieRecommendationsBloc
    extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  final GetMovieRecommendations getMovieRecommendations;
  MovieRecommendationsBloc(this.getMovieRecommendations)
      : super(MovieRecommendationsLoading()) {
    on<LoadMovieRecommendations>(_onLoadMovieRecommendations);
  }

  FutureOr<void> _onLoadMovieRecommendations(LoadMovieRecommendations event,
      Emitter<MovieRecommendationsState> emit) async {
    final result = await getMovieRecommendations(event.movieId);
    result.fold(
        (l) => emit(MovieRecommendationsError(remoteDatasourceError: l)),
        (r) => emit(MovieRecommendationsSuccess(recommendations: r)));
  }
}
