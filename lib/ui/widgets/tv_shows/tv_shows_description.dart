import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/elements/custom_paint.dart';

class TvShowsDescription extends StatelessWidget {
  const TvShowsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(
          'Tv shows',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
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

class TvShowsItemProfile extends StatelessWidget {
  const TvShowsItemProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 220,
      child: Stack(
        children: [
          Image.asset('assets/images/sun.webp'),
          Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Image.asset('assets/images/conclave.webp'),
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
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Name',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          TextSpan(
            text: ' (release year in brackets)',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _TvShowsCirclePercentage extends StatelessWidget {
  const _TvShowsCirclePercentage();

  @override
  Widget build(BuildContext context) {
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
                  percent: 8,
                  fillColors: const Color.fromARGB(113, 255, 255, 255),
                  lineColor: const Color.fromARGB(206, 22, 207, 53),
                  freeColor: const Color.fromARGB(255, 0, 0, 0),
                  lineWidth: 2.5,
                  child: Text('80', style: TextStyle(color: Colors.white)),
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
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.play_arrow, color: Colors.white),
              Text('Play Trailer', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

class TvShowsSummary extends StatelessWidget {
  const TvShowsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      textAlign: TextAlign.center,
      'date, year, (short name of country in brackets), duration, genres',
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
          'Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines, Detailed description, in 3 lines,',
          maxLines: 3,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: miniHelper('Name', 'Job position'),
            ),
            const SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: miniHelper('Name', 'Job position'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: miniHelper('Name', 'Job position'),
            ),
            const SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: miniHelper('Name', 'Job position'),
            ),
          ],
        ),
      ],
    );
  }

  Widget miniHelper(String name, String job) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name, style: const TextStyle(color: Colors.white, fontSize: 16)),
        Text(job, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
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
          SizedBox(height: 270, child: Scrollbar(child: TvShowsCastList())),
        ],
      ),
    );
  }
}

class TvShowsCastList extends StatelessWidget {
  const TvShowsCastList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 145,
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return TvShowsListItem();
      },
    );
  }
}

class TvShowsListItem extends StatelessWidget {
  const TvShowsListItem({super.key});

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/images/pedro.webp'),
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
                        'cast name',
                        maxLines: 2,
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'cast character',
                        style: TextStyle(fontSize: 13),
                        maxLines: 4,
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
