import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';

class MostPopularCelebrities extends StatelessWidget {
  const MostPopularCelebrities({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MostPopularCelebritiesModel>(context);
    if (model == null) return SizedBox.shrink();
    return SizedBox(
      height: 235,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: model.results.length,
          itemExtent: 135,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            model.shownCelebrityAtIndex(index);
            final celebrity = model.results[index];
            final posterPath = celebrity.profilePath;
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                elevation: 4,
                shadowColor: Colors.black.withValues(alpha: 2),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => model.onCelebrityTap(context, index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child:
                            posterPath != null
                                ? Image.network(
                                  ApiClient.imageUrl(posterPath),
                                  width: 125,
                                  fit: BoxFit.fitWidth,
                                )
                                : Image.asset('assets/images/images.png', width: 125, fit: BoxFit.fitWidth, height: 185),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                celebrity.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
          },
        ),
      ),
    );
  }
}
