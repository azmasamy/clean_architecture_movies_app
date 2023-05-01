import 'dart:async';

import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesBloc({required this.getNowPlayingMovies})
      : super(NowPlayingMoviesLoading()) {
    on<LoadNowPlayingMovies>(_onLoadNowPlayingMovies);
  }

  FutureOr<void> _onLoadNowPlayingMovies(
      NowPlayingMoviesEvent event, Emitter<NowPlayingMoviesState> emit) async {
    final result = await getNowPlayingMovies();
    result.fold((l) => emit(NowPlayingMoviesError(remoteDatasourceError: l)),
        (r) => emit(NowPlayingMoviesSuccess(nowPlayingMovies: r)));
  }
}
