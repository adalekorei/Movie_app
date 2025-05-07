import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_response.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TvShowsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tvShows = <TvShow>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  String? searchQuery;
  Timer? searchDeboubce;

  List<TvShow> get tvShows => List.unmodifiable(_tvShows);
  final _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupPagination(BuildContext context) async {
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _tvShows.clear();
    await _loadNextPageTvShows();
  }

  Future<TvShowResponse> _loadTvShows(int page, String local) async {
    final query = searchQuery;
    if (query == null) {
      return await _apiClient.popularTvShows(local, page);
    } else {
      return await _apiClient.searchbarTvShows(local, page, query);
    }
  }

  Future<void> _loadNextPageTvShows() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final tvShowResponse = await _loadTvShows(nextPage, 'en-US');
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

  Future<void> searchbarTvShows(String text) async {
    searchDeboubce?.cancel();
    searchDeboubce = Timer(const Duration(seconds: 1), () async {
      searchQuery = text.isNotEmpty ? text : null;
      await _resetList();
    });
  }

  void shownTvShowAtIndex(int index) {
    if (index < _tvShows.length - 1) return;
    _loadNextPageTvShows();
  }
}
