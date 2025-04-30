import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/follow_on_social_networks.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/most_popular_celebrities.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trending/trending.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                  Trending(),
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
                  MostPopularCelebrities(),
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
