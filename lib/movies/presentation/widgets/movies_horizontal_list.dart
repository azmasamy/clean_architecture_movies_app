import 'package:animate_do/animate_do.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_poster.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movieId: movie.id),
                      ));
                },
                child: MoviePoster(backdropPath: movie.backdropPath!,)),
            );
          },
        ),
      ),
    );
  }
}
