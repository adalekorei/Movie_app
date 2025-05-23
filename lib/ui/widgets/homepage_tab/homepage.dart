import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities_model.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/follow_on_social_networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks_model.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers_model.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trending/trending.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trending/trending_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final trendingModel = TrendingModel();
  final mostPopularCelebritiesModel = MostPopularCelebritiesModel();
  final networksModel = NetworksModel();
  final trailersModel = TrailersModel();

  @override
  void initState() {
    super.initState();

    networksModel.loadNetworks();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    mostPopularCelebritiesModel.setupPagination(context);
    trailersModel.setupPagination(context);
    trendingModel.setupPagination(context);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  NotifierProvider(
                    create: () => trendingModel,
                    isModelManaged: false,
                    child: const Trending(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Upcoming Releases',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  NotifierProvider(
                    create: () => trailersModel,
                    isModelManaged: false,
                    child: const Trailers(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Popular Celebrities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  NotifierProvider(
                    create: () => mostPopularCelebritiesModel,
                    isModelManaged: false,
                    child: const MostPopularCelebrities(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Networks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  NotifierProvider(
                    create: () => networksModel,
                    isModelManaged: false,
                    child: const Networks(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: FollowOnSocialNetworks(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
