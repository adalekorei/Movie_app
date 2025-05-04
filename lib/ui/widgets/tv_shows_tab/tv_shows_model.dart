import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TvShowsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tvShows = <TvShow>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;

  List<TvShow> get tvShows => List.unmodifiable(_tvShows);
  final _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  void setupPagination(BuildContext context) {
    _currentPage = 0;
    _totalPage = 1;
    _tvShows.clear();
    _loadTvShows();
  }

  Future<void> _loadTvShows() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final tvShowResponse = await _apiClient.popularTvShows('en-US', nextPage);
      _tvShows.addAll(tvShowResponse.tvShows);
      _currentPage = tvShowResponse.page ?? 0;
      _totalPage = tvShowResponse.totalPages ?? 0;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onTvShowTap(BuildContext context, int index) {
    final id = _tvShows[index].id;
    Navigator.of(
      context,
    ).pushNamed(MainNavigationRoutes.tvShowsInfo, arguments: id);
  }

  void shownTvShowAtIndex(int index) {
    if (index < _tvShows.length - 1) return;
    _loadTvShows();
  }
}
