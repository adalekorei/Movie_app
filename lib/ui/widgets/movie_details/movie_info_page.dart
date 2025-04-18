import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/elements/custom_paint.dart';

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
        Padding(padding: const EdgeInsets.all(10), child: MediaNames2()),
      ],
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage('assets/images/mickey1.jpg')),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage('assets/images/mickey2.jpg')),
        ),
      ],
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle();

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Mickey 17',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          TextSpan(
            text: ' (2025)',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
                  percent: 6.4,
                  fillColors: const Color.fromARGB(255, 25, 41, 31),
                  lineColor: const Color.fromARGB(206, 22, 207, 53),
                  freeColor: const Color.fromARGB(255, 252, 85, 43),
                  lineWidth: 2.5,
                  child: Text('64', style: TextStyle(color: Colors.white,),),
                ),
              ),
              SizedBox(width: 10,),
              Text(' User Score', style: TextStyle(color: Colors.white,)),
            ],
          ),
        ),
        Container(color: Colors.black, width: 1, height: 15),
        TextButton(
          onPressed: () {},
          child: Row(children: [Icon(Icons.play_arrow, color: Colors.white,), Text('Play Trailer', style: TextStyle(color: Colors.white,))]),
        ),
      ],
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      textAlign: TextAlign.center,
      'R, 09/04/2025, (US) | 1h 58m, Action, Adventure, Thriller',
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
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          maxLines: 3,
          'The film stars Robert Pattinson in the title role, alongside Naomi Ackie. Set in the year 2054, the plot follows a man who joins a space colony as an "Expendable".',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

class MediaNames extends StatelessWidget {
  const MediaNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              ' Robert Pattinson ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              ' Director ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              ' Pattinson Robert ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              ' Novel ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

class MediaNames2 extends StatelessWidget {
  const MediaNames2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              ' Naomi Ackie ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              ' Screenplay ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              ' Mark Ruffalo ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              ' Screenplay ',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
