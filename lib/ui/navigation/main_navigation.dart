import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/auth/auth.dart';
import 'package:movie_app/ui/widgets/auth/auth_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/main_screen/main_screen.dart';
import 'package:movie_app/ui/widgets/main_screen/main_screen_model.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_details/movie_details_model.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_trailer/movie_trailer.dart';

abstract class MainNavigationRoutes {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
  static const movieTrailer = '/movie_details/trailer';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutes.mainScreen : MainNavigationRoutes.auth;
  final routes = <String, Widget Function(BuildContext)>{
    'auth': (context) => NotifierProvider(create: () => AuthModel(), child: Auth()),
    '/': (context) => NotifierProvider(create: () => MainScreenModel(), child: MainScreen(),),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => NotifierProvider(create: () => MovieDetailsModel(movieId), child: const MovieDetails()),
        );
        case MainNavigationRoutes.movieTrailer:
        final arguments = settings.arguments;
final youtubeKey = arguments is String ? arguments : '';
return MaterialPageRoute(
          builder: (context) => MovieTrailer(youtubeKey: youtubeKey),
        );
      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
