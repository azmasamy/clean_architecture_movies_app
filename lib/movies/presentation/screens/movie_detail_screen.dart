import 'package:clean_architecture_movies_app/core/services/service_locator.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => MovieDetailsBloc(getMovieDetails: getIt())
        ..add(LoadMovieDetails(movieId)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return MovieDetailsContent(movieDetails: state.movieDetails);
          } else if (state is MovieDetailsError) {
            return Text(state.remoteDatasourceError.message);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
