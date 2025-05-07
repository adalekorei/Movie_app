import 'package:flutter/material.dart';

class CelebritiesInfo extends StatelessWidget {
  const CelebritiesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Celebrity name',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: CelebritiesPhoto(),
    );
  }
}

class CelebritiesPhoto extends StatelessWidget {
  const CelebritiesPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 220,
          child: Row(
            children: [
              Image.asset('assets/images/pedro.webp', height: 200, width: 150),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: 255,
                      child: Text(
                        'Boin in.. ballalalalallaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        maxLines: 8,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Boin in DATE, YEAR'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Known For',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        KnownFor(),
        Acting(),
      ],
    );
  }
}

class KnownFor extends StatelessWidget {
  const KnownFor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 190, child: Scrollbar(child: ((KnownForMovies())))),
      ],
    );
  }
}

class KnownForMovies extends StatelessWidget {
  const KnownForMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemExtent: 115,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return KnownForItem();
      },
    );
  }
}

class KnownForItem extends StatelessWidget {
  const KnownForItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.7),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/complete.webp'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text('Movie name'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Acting extends StatelessWidget {
  const Acting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Acting',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text('year'),
              SizedBox(width: 25),
              Text('Name of movie/tv show'),
            ],
          ),
        ),
      ],
    );
  }
}
