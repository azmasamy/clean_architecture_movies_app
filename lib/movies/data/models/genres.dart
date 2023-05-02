import 'package:clean_architecture_movies_app/movies/domain/entities/genres.dart';

class GenresModel extends Genre {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}
