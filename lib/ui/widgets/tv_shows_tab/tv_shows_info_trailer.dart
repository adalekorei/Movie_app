import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsInfoTrailer extends StatefulWidget {
  final String youtubeKey;
  const TvShowsInfoTrailer({super.key, required this.youtubeKey});

  @override
  State<TvShowsInfoTrailer> createState() => _TrailersInfoState();
}

class _TrailersInfoState extends State<TvShowsInfoTrailer> {
  late final _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
    return YoutubePlayerBuilder(
      player: player,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Trailer',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(child: player),
        );
      },
    );
  }
}
