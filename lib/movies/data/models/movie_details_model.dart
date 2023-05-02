import 'package:clean_architecture_movies_app/movies/domain/entities/genres.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genres: List<Genre>.from(json['genres']
            .map((genre) => Genre(name: genre['name'], id: genre['id']))),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        runtime: json['runtime'],
      );
}
