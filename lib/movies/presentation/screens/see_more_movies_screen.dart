import 'package:clean_architecture_movies_app/core/style/constants/color_constants.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_poster.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_rating.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movie_release_year.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMoreMoviesScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const SeeMoreMoviesScreen(
      {super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black.withOpacity(0.2), // <-- SEE HERE
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movieId: movie.id),
                  )),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.kPrimaryAccentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      MoviePoster(
                        backdropPath: movie.backdropPath!,
                        width: 80,
                        height: 120,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                MovieReleaseDate(
                                    releaseDate: movie.releaseDate),
                                const SizedBox(
                                  width: 10,
                                ),
                                MovieRating(rating: movie.voteAverage),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
