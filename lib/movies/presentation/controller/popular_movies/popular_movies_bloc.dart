import 'dart:async';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/popular_movies/popular_movies_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movies_event.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesLoading()) {
    on<PopularMoviesEvent>(_onLoadPopularMovies);
  }

  FutureOr<void> _onLoadPopularMovies(
      PopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    final result = await getPopularMovies();
    result.fold((l) => emit(PopularMoviesError(remoteDatasourceError: l)),
        (r) => emit(PopularMoviesSuccess(popularMovies: r)));
  }
}
