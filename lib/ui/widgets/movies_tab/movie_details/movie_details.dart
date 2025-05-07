import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details_model.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_info_page.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_screen_cast.dart';
import 'package:movie_app/ui/widgets/my_app/my_app_model.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailsState();
  }
}

class _MovieDetailsState extends State<MovieDetails> {

@override
  void initState() {
    super.initState();
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    final appModel = Provider.read<MyAppModel>(context);
    model?.onSessionExpired = () => appModel?.resetSession(context);
  }

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
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Title(),
      ),
      body: const ColoredBox(
        color: Color.fromARGB(255, 0, 35, 43),
        child: _Body(),
      ),
    );
  }
}

class Title extends StatelessWidget {
  Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Text(
      model?.movieDetails?.title ?? 'Loading..',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if(movieDetails == null) {
      return Center(child: const CircularProgressIndicator());
    }
    return ListView(children: [MovieInfoPage(), MovieScreenCast()]);
  }
}
