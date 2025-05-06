import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_details_credits.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/elements/custom_paint.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/tv_shows_info_model.dart';

class TvShowsInfo extends StatefulWidget {
  const TvShowsInfo({super.key});

  @override
  State<TvShowsInfo> createState() => _TvShowsInfoState();
}

class _TvShowsInfoState extends State<TvShowsInfo> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotifierProvider.read<TvShowsInfoModel>(context)?.loadDetails();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    final tvShowDetails = model?.tvShowDetails;
    if (tvShowDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(toolbarHeight: 40, centerTitle: true, title: Title()),
      body: ListView(
        children: [
          Column(
            children: [
              TvShowsItemProfile(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TvShowsItemTitle(),
              ),
              _TvShowsCirclePercentage(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 60,
                ),
                child: TvShowsSummary(),
              ),
              Padding(padding: const EdgeInsets.all(10), child: Overview()),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TvShowsMediaNames(),
              ),
              SizedBox(height: 10),
              TvShowsCast(),
            ],
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    return Text(
      model?.tvShowDetails?.name ?? 'Loading..',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class TvShowsItemProfile extends StatelessWidget {
  const TvShowsItemProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    final backdropPath = model?.tvShowDetails?.backdropPath;
    final posterPath = model?.tvShowDetails?.posterPath;
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
            child: Icon(Icons.star_border, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class TvShowsItemTitle extends StatelessWidget {
  const TvShowsItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    final doubleDate = extractYear(model?.tvShowDetails?.firstAirDate ?? '');
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            model?.tvShowDetails?.name ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          doubleDate!.toStringAsFixed(0),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

int? extractYear(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) return null;
  try {
    final date = DateTime.parse(dateStr);
    return date.year;
  } catch (e) {
    return null;
  }
}

class _TvShowsCirclePercentage extends StatelessWidget {
  const _TvShowsCirclePercentage();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context)?.tvShowDetails;
    var voteAverage =
        NotifierProvider.watch<TvShowsInfoModel>(
          context,
        )?.tvShowDetails?.voteAverage ??
        0;
    final videos = model?.videos?.results.where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;
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
        trailerKey != null ? TextButton(
          onPressed: () => Navigator.of(context).pushNamed(
                    MainNavigationRoutes.tvShowVideoTrailer,
                    arguments: trailerKey,
                  ), 
          child: Row(
            children: [
              Icon(Icons.play_arrow, color: Colors.white),
              Text('Play Trailer', style: TextStyle(color: Colors.white)),
            ],
          ),
        ) : Text('Trailer is not available', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class TvShowsSummary extends StatelessWidget {
  const TvShowsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    var text = <String>[];
    final doubleDate = extractYear(model?.tvShowDetails?.firstAirDate ?? '');
    final country = model?.tvShowDetails?.originCountry;
    final numberOfSeasons = model?.tvShowDetails?.numberOfSeasons;
    final numberOfEpisodes = model?.tvShowDetails?.numberOfEpisodes;
    final status = model?.tvShowDetails?.status;

    if (doubleDate != null ||
        country != null ||
        numberOfSeasons != null ||
        numberOfEpisodes != null ||
        status != null) {
      text.add('$doubleDate,'.toString());
      text.add('$country,'.toString());
      text.add('$numberOfSeasons seasons,'.toString());
      text.add('$numberOfEpisodes episodes,'.toString());
      text.add('status $status,'.toString().toLowerCase());
    }

    return Text(
      maxLines: 3,
      textAlign: TextAlign.center,
      text.join(' '),
      style: TextStyle(
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
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
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
          model?.tvShowDetails?.overview ?? 'not available',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}

class TvShowsMediaNames extends StatelessWidget {
  const TvShowsMediaNames({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    var crew = model?.tvShowDetails?.credits?.crew;
    if (crew == null || crew.isEmpty) return SizedBox.shrink();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;

    var crewChunks = <List<Crew>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2).cast<Crew>(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: crewChunks.map((chunk) => PeopleRow(crew: chunk)).toList(),
    );
  }
}

class PeopleRow extends StatelessWidget {
  final List<Crew> crew;
  const PeopleRow({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: crew.map((crew) => People(crew: crew)).toList(),
    );
  }
}

class People extends StatelessWidget {
  final Crew crew;
  const People({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(crew.name, style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 2),
          Text(crew.job, style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TvShowsCast extends StatelessWidget {
  const TvShowsCast({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Series Cast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 280, child: Scrollbar(child: TvShowsCastList())),
        ],
      ),
    );
  }
}

class TvShowsCastList extends StatelessWidget {
  const TvShowsCastList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsInfoModel>(context);
    var cast = model?.tvShowDetails?.credits?.cast;
    if (cast == null || cast.isEmpty) return SizedBox.shrink();
    return ListView.builder(
      itemExtent: 120,
      itemCount: cast.length < 6 ? cast.length : 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return CastList(castIndex: index);
      },
    );
  }
}

class CastList extends StatelessWidget {
  final int castIndex;
  const CastList({super.key, required this.castIndex});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<TvShowsInfoModel>(context);
    var cast = model!.tvShowDetails!.credits!.cast![castIndex];
    final posterPath = cast.profilePath;
    return Padding(
      padding: EdgeInsets.all(6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              posterPath != null
                  ? Image.network(
                    ApiClient.imageUrl(posterPath),
                    width: 135,
                    fit: BoxFit.fitWidth,
                  )
                  : Image.asset(
                    'assets/images/images.png',
                    width: 125,
                    fit: BoxFit.fitWidth,
                    height: 165,
                  ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 1.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cast.name,
                        maxLines: 2,
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 5),
                      Text(
                        cast.character,
                        style: TextStyle(fontSize: 13),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
