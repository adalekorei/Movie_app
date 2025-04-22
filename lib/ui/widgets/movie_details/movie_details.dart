import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_info_page.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_screen_cast.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailsState();
  }
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        title: Title(),
      ),
      body: ColoredBox(
        color: const Color.fromARGB(197, 79, 141, 122),
        child: ListView(children: [MovieInfoPage(), MovieScreenCast()]),
      ),
    );
  }
}

class Title extends StatelessWidget {
  Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Text(model?.movieDetails?.title ?? 'Loading..',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

