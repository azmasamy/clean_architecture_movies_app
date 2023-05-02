import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final double rating;
  const MovieRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          (rating / 2).toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
