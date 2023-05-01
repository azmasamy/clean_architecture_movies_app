import 'package:clean_architecture_movies_app/core/services/service_locator.dart';
import 'package:clean_architecture_movies_app/core/style/theme.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      home: const MoviesScreen(),
    );
  }
}
