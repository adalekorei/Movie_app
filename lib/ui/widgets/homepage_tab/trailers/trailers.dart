import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';

class Trailers extends StatelessWidget {
  const Trailers({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TrailersModel>(context);
    if (model == null) return SizedBox.shrink();
    return SizedBox(
      height: 280,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: model.trailers.length,
          itemExtent: 370,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            model.shownTrailerAtIndex(index);
            final trailers = model.trailers[index];
            final posterPath = trailers.posterPath;
            return Padding(
              padding: const EdgeInsets.all(6),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 40,
                        width: 370,
                        height: 270,
                        child: Image.network(
                          ApiClient.imageUrl(trailers.backdropPath),
                          width: 125,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        width: 140,
                        height: 140,
                        child:
                            posterPath != null
                                ? Image.network(
                                  ApiClient.imageUrl(posterPath),
                                  width: 125,
                                )
                                : Image.asset(
                                  'assets/images/images.png',
                                  width: 125,
                                  fit: BoxFit.fitWidth,
                                  height: 185,
                                ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trailers.title),
                            Text('Watch the Trailer'),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 130,
                        child: Row(
                          children: [
                            Icon(Icons.thumb_up, size: 17),
                            SizedBox(width: 5),
                            Text(trailers.voteCount.toString()),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 135,
                        left: 140,
                        child: Icon(
                          Icons.play_arrow,
                          size: 70,
                          color: const Color.fromARGB(206, 255, 255, 255),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () => model.onTrailerTap(context, index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
