part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsSuccess({required this.movieDetails});
}

class MovieDetailsError extends MovieDetailsState {
  final GeneralError remoteDatasourceError;
  const MovieDetailsError({required this.remoteDatasourceError});
}
