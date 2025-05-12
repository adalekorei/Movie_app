import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trending/trending_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TrendingModel>(context);
    if (model == null) return SizedBox.shrink();
    return Column(
      children: [
        SizedBox(
          height: 235,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: model.trendingAll.length,
              itemExtent: 135,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                model.shownTrendingMoviesAndShowsAtIndex(index);
                final moviesAndTvShows = model.trendingAll[index];
                final posterPath = moviesAndTvShows.posterPath;
                return Padding(
                  padding: EdgeInsets.all(6),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    shadowColor: Colors.black.withAlpha(180),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 170,
                                  width: double.infinity,
                                  child:
                                      posterPath != null
                                          ? Image.network(
                                            ApiClient.imageUrl(posterPath),
                                            width: 115,
                                            fit: BoxFit.fitWidth,
                                          )
                                          : SizedBox.shrink(),
                                ),
                                Positioned(
                                  right: 8,
                                  bottom: 8,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 15,
                                  ),
                                  child: Text(
                                    moviesAndTvShows.movieAndTvShowTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
