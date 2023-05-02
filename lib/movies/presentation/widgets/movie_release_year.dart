import 'package:clean_architecture_movies_app/core/style/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MovieReleaseDate extends StatelessWidget {
  final String releaseDate;
  const MovieReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.kSecondaryColorAccent,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        releaseDate.split('-')[0],
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
