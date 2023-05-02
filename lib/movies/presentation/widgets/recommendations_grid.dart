import 'package:animate_do/animate_do.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_poster.dart';
import 'package:flutter/material.dart';

class RecommendationsGrid extends StatelessWidget {
  final List<Movie> recommendations;
  const RecommendationsGrid({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = recommendations[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movieId: recommendation.id),
                        ));
                  },
                  child: MoviePoster(backdropPath: recommendation.backdropPath!),
                ),
              );
            },
            childCount: recommendations.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        ));
  }
}
