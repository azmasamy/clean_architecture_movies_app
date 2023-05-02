import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movies_app/core/constants/api_constants.dart';
import 'package:clean_architecture_movies_app/core/services/service_locator.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/genres.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movie_recommendations/movie_recommendations_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_rating.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_release_year.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/recommendations_grid.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/recommendations_grid_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsContent({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5, 1.0, 1.0],
                  ).createShader(
                    Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: apiImagesBaseUrl + movieDetails.backdropPath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movieDetails.title,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      )),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      MovieReleaseDate(releaseDate: movieDetails.releaseDate),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          MovieRating(rating: movieDetails.voteAverage),
                          const SizedBox(width: 4.0),
                          Text(
                            '(${movieDetails.voteAverage})',
                            style: const TextStyle(
                              fontSize: 1.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        _showDuration(movieDetails.runtime),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    movieDetails.overview,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Genres: ${_showGenres(movieDetails.genres)}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'More like this'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => MovieRecommendationsBloc(getIt())
            ..add(LoadMovieRecommendations(movieDetails.id)),
          child:
              BlocBuilder<MovieRecommendationsBloc, MovieRecommendationsState>(
            builder: (context, state) {
              if (state is MovieRecommendationsSuccess) {
                return RecommendationsGrid(
                  recommendations: state.recommendations,
                );
              } else if (state is MovieRecommendationsError) {
                return Text(state.remoteDatasourceError.message);
              } else {
                return const RecommendationsGridLoading();
              }
            },
          ),
        ),
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
