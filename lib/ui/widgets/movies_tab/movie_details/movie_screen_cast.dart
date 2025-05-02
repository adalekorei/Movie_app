import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details_model.dart';

class MovieScreenCast extends StatelessWidget {
  const MovieScreenCast({super.key});

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
          SizedBox(height: 270, child: Scrollbar(child: CastList())),
        ],
      ),
    );
  }
}

class CastList extends StatelessWidget {
  const CastList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var cast = model?.movieDetails?.credits.cast;
    if (cast == null || cast.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: 10,
      itemExtent: 120,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return CastListItem(castIndex: index);
      },
    );
  }
}

class CastListItem extends StatelessWidget {
  final int castIndex;
  const CastListItem({super.key, required this.castIndex});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    final cast = model!.movieDetails!.credits.cast[castIndex];
    final profilePath = cast.profilePath;
    return Padding(
      padding: const EdgeInsets.all(6.0),
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
              profilePath != null
                  ? Image.network(ApiClient.imageUrl(profilePath))
                  : Image.asset('assets/images/images.png', width: 125, fit: BoxFit.fitWidth, height: 165,),
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
