import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities_model.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/follow_on_social_networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers.dart';
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

  @override
  void initState() {
    super.initState();

    trendingModel.loadTrendingAll();
    mostPopularCelebritiesModel.loadCelebrities();
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
                      'Latest Trailers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Trailers(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Most Popular Celebrities",
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
                  Networks(),
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
