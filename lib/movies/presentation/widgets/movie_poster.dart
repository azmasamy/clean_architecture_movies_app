import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movies_app/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviePoster extends StatelessWidget {
  final String backdropPath;
  final double height;
  final double width;
  const MoviePoster({
    super.key,
    required this.backdropPath,
    this.height = 170.0,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: CachedNetworkImage(
        width: width,
        height: height,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        imageUrl: apiImagesBaseUrl + backdropPath,
        placeholder: (context, url) => Shimmer.fromColors(
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
  }
}
