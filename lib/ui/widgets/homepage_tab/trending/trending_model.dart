import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/trending/trending_all.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TrendingModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _moviesAndTvShows = <TrendingAll>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;

  List<TrendingAll> get trendingAll => List.unmodifiable(_moviesAndTvShows);

  void setupPagination(BuildContext context) {
    _currentPage = 0;
    _totalPage = 1;
    _moviesAndTvShows.clear();
    _loadTrendingAll();
  }

  Future<void> _loadTrendingAll() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final responseMoviesAndTvShows = await _apiClient.trendingMoviesAndShows(
        'en-US',
        time_window: 'week',
        nextPage,
      );
      _moviesAndTvShows.addAll(responseMoviesAndTvShows.moviesAndTvShows);
      _currentPage = responseMoviesAndTvShows.page ?? 0;
      _totalPage = responseMoviesAndTvShows.totalPages ?? 0;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieAndTvShowTap(BuildContext context, int index) {
    final id = trendingAll[index].id;
    Navigator.of(
      context,
    ).pushNamed(MainNavigationRoutes.trendingDescription, arguments: id);
  }

    void shownTrendingMoviesAndShowsAtIndex(int index) {
    if (index < _moviesAndTvShows.length - 1) return;
    _loadTrendingAll();
  }
}
