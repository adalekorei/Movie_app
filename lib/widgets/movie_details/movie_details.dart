import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/widgets/movie_details/movie_info_page.dart';
import 'package:movie_app/widgets/movie_details/movie_screen_cast.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({super.key, required this.movieId});

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailsState();
  }
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        title: const Text(
          'Movie App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ColoredBox(
        color: const Color.fromARGB(197, 79, 141, 122),
        child: ListView(children: [MovieInfoPage(), MovieScreenCast()]),
      ),
    );
  }
}
