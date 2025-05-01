import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/movies/movie_details_credits.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';
import 'package:movie_app/ui/widgets/elements/custom_paint.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details_model.dart';

class MovieInfoPage extends StatelessWidget {
  const MovieInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPoster(),
        Padding(padding: const EdgeInsets.all(10), child: _MovieTitle()),
        _CirclePercentage(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          child: Summary(),
        ),
        Padding(padding: const EdgeInsets.all(10), child: Overview()),
        SizedBox(height: 20),
        Padding(padding: const EdgeInsets.all(10), child: MediaNames()),
      ],
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final backdropPath = model?.movieDetails?.backdropPath;
    final posterPath = model?.movieDetails?.posterPath;

    return AspectRatio(
      aspectRatio: 390 / 220,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ApiClient.imageUrl(backdropPath))
              : SizedBox.shrink(),
          Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child:
                posterPath != null
                    ? Image.network(ApiClient.imageUrl(posterPath))
                    : SizedBox.shrink(),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              onPressed: () => model?.switchFavorite(),
              icon: Icon(
                model?.isMovieFavorite == true ? Icons.star : Icons.star_border, color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var year = model?.movieDetails?.releaseDate?.year.toString();
    year = year != null ? ' ($year)' : '';
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: model?.movieDetails?.title ?? '',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          TextSpan(
            text: year,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _CirclePercentage extends StatelessWidget {
  const _CirclePercentage();

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    var voteAverage = movieDetails?.voteAverage ?? 0;
    final videos =
        movieDetails?.videos.results
            .where(
              (video) => video.type == 'Trailer' && video.site == 'YouTube',
            )
            .toList();
    final trailerKey =
        videos != null && videos.isNotEmpty ? videos.first.key : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: UserScore(
                  percent: voteAverage,
                  fillColors: const Color.fromARGB(113, 255, 255, 255),
                  lineColor: const Color.fromARGB(206, 22, 207, 53),
                  freeColor: const Color.fromARGB(255, 0, 0, 0),
                  lineWidth: 2.5,
                  child: Text(
                    voteAverage.toStringAsFixed(1),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(' User Score', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 1,
          height: 15,
        ),
        trailerKey != null
            ? TextButton(
              onPressed:
                  () => Navigator.of(context).pushNamed(
                    MainNavigationRoutes.movieTrailer,
                    arguments: trailerKey,
                  ),
              child: Row(
                children: [
                  Icon(Icons.play_arrow, color: Colors.white),
                  Text('Play Trailer', style: TextStyle(color: Colors.white)),
                ],
              ),
            )
            : const Text(
              'Trailer is not available',
              style: TextStyle(color: Colors.white),
            ),
      ],
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);

    if (model == null) return SizedBox.shrink();
    var text = <String>[];
    final releaseDate = model.movieDetails?.releaseDate;
    if (releaseDate != null) {
      text.add(model.stringFromDate(releaseDate));
    }
    final country = model.movieDetails?.productionCountries;
    if (country != null && country.isNotEmpty) {
      text.add('(${country.first.iso})');
    }

    final runtime = model.movieDetails?.runtime ?? 0;
    final duration = Duration(minutes: runtime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    text.add('${hours}h ${minutes}m');

    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresName = <String>[];
      for (var genr in genres) {
        genresName.add(genr.name);
      }
      text.add(genresName.join(', '));
    }

    return Text(
      maxLines: 3,
      textAlign: TextAlign.center,
      text.join(' '),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          maxLines: 3,
          model?.movieDetails?.overview ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}

class MediaNames extends StatelessWidget {
  const MediaNames({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var crew = model?.movieDetails?.credits.crew;
    if (crew == null || crew.isEmpty) return const SizedBox.shrink();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;

    var crewChunks = <List<Crew>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }

    return Column(
      children:
          crewChunks
              .map(
                (chunk) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MediaNamesRow(crew: chunk),
                ),
              )
              .toList(),
    );
  }
}

class MediaNamesRow extends StatelessWidget {
  final List<Crew> crew;
  const MediaNamesRow({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,

      children: crew.map((crew) => MediaNamesRowItem(crew: crew)).toList(),
    );
  }
}

class MediaNamesRowItem extends StatelessWidget {
  final Crew crew;
  const MediaNamesRowItem({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(crew.name, style: TextStyle(color: Colors.white, fontSize: 14)),
          Text(crew.job, style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

