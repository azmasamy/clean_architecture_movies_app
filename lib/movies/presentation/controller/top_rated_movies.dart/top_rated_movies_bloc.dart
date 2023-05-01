import 'dart:async';

import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies getTopRatedMovies;
  TopRatedMoviesBloc({required this.getTopRatedMovies}) : super(TopRatedMoviesLoading()) {
    on<TopRatedMoviesEvent>(_onLoadTopRatedMovies);
  }

  FutureOr<void> _onLoadTopRatedMovies(
      TopRatedMoviesEvent event, Emitter<TopRatedMoviesState> emit) async {
    final result = await getTopRatedMovies();
    result.fold((l) => emit(TopRatedMoviesError(remoteDatasourceError: l)),
        (r) => emit(TopRatedMoviesSuccess(topRatedMovies: r)));
  }
}
