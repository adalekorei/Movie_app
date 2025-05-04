import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/searchbar/custom_searchbar.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/tv_shows_model.dart';

class TvShows extends StatefulWidget {
  const TvShows({super.key});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TvShowsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 65),
          itemCount: model.tvShows.length,
          itemExtent: 165,
          itemBuilder: (BuildContext context, int index) {
            model.shownTvShowAtIndex(index);
            final tvShow = model.tvShows[index];
            final posterPath = tvShow.posterPath;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        posterPath != null
                            ? Image.network(
                              ApiClient.imageUrl(posterPath),
                              width: 95,
                            )
                            : Image.asset('assets/images/images.png', width: 95, fit: BoxFit.fitWidth, height: 185,),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                tvShow.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                model.stringFromDate(
                                  DateTime.tryParse(tvShow.firstAirDate),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                tvShow.overview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => model.onTvShowTap(context, index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        CustomSearchbar(),
      ],
    );
  }
}
