import 'package:animate_do/animate_do.dart';
import 'package:clean_architecture_movies_app/movies/presentation/widgets/movies_horizontal_list_title.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesHorizontalListLoading extends StatelessWidget {
  final String title;
  const MoviesHorizontalListLoading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviesHorizontalListTitle(title: title),
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
