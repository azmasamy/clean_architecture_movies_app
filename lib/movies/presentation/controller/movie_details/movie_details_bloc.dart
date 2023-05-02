import 'dart:async';

import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc({required this.getMovieDetails})
      : super(MovieDetailsLoading()) {
    on<LoadMovieDetails>(_onLoadNowPlayingMovies);
  }

  FutureOr<void> _onLoadNowPlayingMovies(
      LoadMovieDetails event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetails(event.movieId);
    result.fold((l) => emit(MovieDetailsError(remoteDatasourceError: l)),
        (r) => emit(MovieDetailsSuccess(movieDetails: r)));
  }
}
