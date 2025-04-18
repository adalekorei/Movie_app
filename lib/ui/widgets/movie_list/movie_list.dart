import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  const Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieList extends StatefulWidget {
  MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _movies = [
    Movie(
      id: 1,
      imageName: 'assets/images/mikki.jpeg',
      title: 'Mickey 17',
      time: 'April 8, 2025',
      description:
          'Mickey 17 is a 2025 science fiction black comedy film written, produced, and directed by Bong Joon Ho, based on the 2022 novel Mickey7 by Edward Ashton. The film stars Robert Pattinson in the title role, alongside Naomi Ackie, Steven Yeun, Toni Collette, and Mark Ruffalo.',
    ),
    Movie(
      id: 2,
      imageName: 'assets/images/conclave.webp',
      title: 'Conclave',
      time: 'April 12, 2025',
      description:
          'After the unexpected death of the Pope, Cardinal Lawrence is tasked with managing the covert and ancient ritual of electing a new one. Sequestered in the Vatican with the Catholic Church’s most powerful leaders until the process is complete, Lawrence finds himself at the center of a conspiracy that could lead to its downfall.',
    ),
    Movie(
      id: 3,
      imageName: 'assets/images/den.webp',
      title: 'Den of Thieves 2: Pantera',
      time: 'April 15, 2025',
      description:
          "Big Nick is back on the hunt in Europe and closing in on Donnie, who is embroiled in the treacherous and unpredictable world of diamond thieves and the infamous Panther mafia, as they plot a massive heist of the world's largest diamond exchange.",
    ),
    Movie(
      id: 4,
      imageName: 'assets/images/terrifier.webp',
      title: 'Terrifier 3',
      time: 'April 18, 2025',
      description:
          "Five years after surviving Art the Clown's Halloween massacre, Sienna and Jonathan are still struggling to rebuild their shattered lives. As the holiday season approaches, they try to embrace the Christmas spirit and leave the horrors of the past behind. But just when they think they're safe, Art returns, determined to turn their holiday cheer into a new nightmare. The festive season quickly unravels as Art unleashes his twisted brand of terror, proving that no holiday is safe.",
    ),
    Movie(
      id: 5,
      imageName: 'assets/images/we live in time.webp',
      title: 'We Live in Time',
      time: 'April 21, 2025',
      description:
          "The purposeful Almut has always wanted to become a successful chef, while the romantic Tobias has gone through a divorce from his wife. Fate brings them together, and soon they have a cozy home and a charming daughter. Unexpectedly, the couple learns of a woman's serious illness, so they decide to live every minute, realizing the value of life.",
    ),
    Movie(
      id: 6,
      imageName: 'assets/images/grafted.webp',
      title: 'Grafted',
      time: 'April 24, 2025',
      description:
          'When an awkward but brilliant Chinese student wins a scholarship into a prestigious New Zealand University, she finds a new way of achieving the popularity she craves one bloody body at a time.',
    ),
    Movie(
      id: 7,
      imageName: 'assets/images/complete.webp',
      title: 'A Complete Unknown',
      time: 'April 27, 2025',
      description:
          'New York, early 1960s. Against the backdrop of a vibrant music scene and tumultuous cultural upheaval, an enigmatic 19-year-old from Minnesota arrives in the West Village with his guitar and revolutionary talent, destined to change the course of American music.',
    ),
    Movie(
      id: 8,
      imageName: 'assets/images/companion.webp',
      title: 'Companion',
      time: 'April 30, 2025',
      description:
          'A psychological thriller directed and written by Drew Hancock introduces the audience to a girl named Iris and her best friends. One day, the lives of the heroes change dramatically when, suddenly, a man dies in their hometown, a famous billionaire.',
    ),
    Movie(
      id: 9,
      imageName: 'assets/images/robot.webp',
      title: 'The Wild Robot',
      time: 'May 3, 2025',
      description:
          'A ship carrying an intelligent robot named ROZZUM 7134 is wrecked. The hero finds himself on a remote island in rather harsh conditions. To survive, Roz gets acquainted and becomes close to the local animals. Besides, he begins to take care of a baby goose, which has become an orphan…',
    ),
    Movie(
      id: 10,
      imageName: 'assets/images/sonic.webp',
      title: 'Sonic the Hedgehog 3',
      time: 'May 6, 2025',
      description:
          "When a powerful new enemy appears, Sonic, Tails, and Knuckles join forces once again. The team's opponent turns out to be the mysterious Shadow the Hedgehog, who has power and strength like no one has ever seen before. With their unique abilities, Sonic's team members must protect the world from evil.",
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies =
          _movies.where((Movie movie) {
            return movie.title.toLowerCase().contains(query.toLowerCase());
          }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index){
    final id = _movies[index].id;
Navigator.of(context).pushNamed('/main screen/movie details', arguments: id,);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 65),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 165,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2),
                              Text(movie.time),
                              SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTap(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
