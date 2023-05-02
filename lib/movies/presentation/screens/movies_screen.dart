import 'package:clean_architecture_movies_app/movies/presentation/controller/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/popular_movies/popular_movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/popular_movies/popular_movies_state.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/see_more_movies_screen.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movies_carousel.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movies_carousel_loading.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movies_horizontal_list.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movies_horizontal_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_movies_app/core/services/service_locator.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PopularMoviesBloc(getPopularMovies: getIt())
              ..add(LoadPopularMovies()),
          ),
          BlocProvider(
            create: (context) =>
                NowPlayingMoviesBloc(getNowPlayingMovies: getIt())
                  ..add(LoadNowPlayingMovies()),
          ),
          BlocProvider(
            create: (context) => TopRatedMoviesBloc(getTopRatedMovies: getIt())
              ..add(LoadTopRatedMovies()),
          ),
        ],
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
                  builder: (context, state) {
                    if (state is NowPlayingMoviesSuccess) {
                      return MoviesCarousel(movies: state.nowPlayingMovies);
                    } else if (state is NowPlayingMoviesError) {
                      return const Text('Something went Wrong');
                    } else {
                      return const MoviesCarouselLoading();
                    }
                  },
                ),
                BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                    if (state is PopularMoviesSuccess) {
                      return MoviesHorizontalList(
                          movies: state.popularMovies,
                          title: 'Popular',
                          onSeeMoreTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeMoreMoviesScreen(
                                      title: 'Popular',
                                      movies: state.popularMovies),
                                ),
                              ));
                    } else if (state is PopularMoviesError) {
                      return const Text('Something went Wrong');
                    } else {
                      return const MoviesHorizontalListLoading(
                        title: 'Popular',
                      );
                    }
                  },
                ),
                BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                    if (state is TopRatedMoviesSuccess) {
                      return MoviesHorizontalList(
                          movies: state.topRatedMovies,
                          title: 'Top Rated',
                          onSeeMoreTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeMoreMoviesScreen(
                                      title: 'Top Rated',
                                      movies: state.topRatedMovies),
                                ),
                              ));
                    } else if (state is TopRatedMoviesError) {
                      return const Text('Something went Wrong');
                    } else {
                      return const MoviesHorizontalListLoading(
                          title: 'Top Rated');
                    }
                  },
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ));
  }
}
