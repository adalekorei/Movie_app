import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/auth/auth.dart';
import 'package:movie_app/ui/widgets/auth/auth_model.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks_known_for_movies.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks_info.dart';
import 'package:movie_app/ui/widgets/homepage_tab/most_popular_celebrities/celebrities_info.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trailers/trailers_info.dart';
import 'package:movie_app/ui/widgets/homepage_tab/trending/trending_description.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/main_screen/main_screen.dart';
import 'package:movie_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details_model.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_trailer/movie_trailer.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/tv_shows_info.dart';

abstract class MainNavigationRoutes {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
  static const movieTrailer = '/movie_details/trailer';
  static const trendingDescription = '/trending_description';
  static const trailersInfo = '/trailers_info';
  static const celebritiesInfo = '/celebrities_info';
  static const networksInfo = '/networks_info';
  static const tvShowsInfo = '/tv_show_info';
  static const networksKnownForMovies = '/networks_known_for_movies';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutes.mainScreen : MainNavigationRoutes.auth;
  final routes = <String, Widget Function(BuildContext)>{
    'auth':
        (context) => NotifierProvider(create: () => AuthModel(), child: Auth()),
    '/':
        (context) => NotifierProvider(
          create: () => MainScreenModel(),
          child: MainScreen(),
        ),
    MainNavigationRoutes.trendingDescription:
        (context) => const TrendingDescription(),
    MainNavigationRoutes.celebritiesInfo: (context) => const CelebritiesInfo(),
    MainNavigationRoutes.networksInfo: (context) => const NetworksInfo(),
    MainNavigationRoutes.tvShowsInfo: (context) => const TvShowsInfo(),
    MainNavigationRoutes.networksKnownForMovies:
        (context) => const NetworksKnownForMovies(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder:
              (context) => NotifierProvider(
                create: () => MovieDetailsModel(movieId),
                child: const MovieDetails(),
              ),
        );
      case MainNavigationRoutes.movieTrailer:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : 'dQw4w9WgXcQ';
        return MaterialPageRoute(
          builder: (context) => MovieTrailer(youtubeKey: youtubeKey),
        );
        case MainNavigationRoutes.trailersInfo:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : 'dQw4w9WgXcQ';
        return MaterialPageRoute(
          builder: (context) => TrailersInfo(youtubeKey: youtubeKey),
        );
      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
