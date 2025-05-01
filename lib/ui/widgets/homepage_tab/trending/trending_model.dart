import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/trending/trending_all.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TrendingModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _moviesAndTvShows = <TrendingAll>[];
  List<TrendingAll> get trendingAll => List.unmodifiable(_moviesAndTvShows);

  Future<void> loadTrendingAll() async {
    final responseMoviesAndTvShows = await _apiClient.trendingMoviesAndShows('en-US', time_window: 'week');
    _moviesAndTvShows.addAll(responseMoviesAndTvShows.moviesAndTvShows);
    notifyListeners();
  }

  void onMovieAndTvShowTap(BuildContext context, int index) {
    final id = trendingAll[index].id;
    Navigator.of(context).pushNamed(MainNavigationRoutes.trendingDescription, arguments: id);
  }
}
