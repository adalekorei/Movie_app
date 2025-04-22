import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/movies.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movies>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  List<Movies> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;
  String _local = '';

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  void setupLocal(BuildContext context) {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _dateFormat = DateFormat.yMMMMd(local);
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponse = await _apiClient.popularMovies(nextPage, _local);
      _movies.addAll(moviesResponse.movies);
      _currentPage = moviesResponse.page;
      _totalPage = moviesResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(
      context,
    ).pushNamed(MainNavigationRoutes.movieDetails, arguments: id);
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadMovies();
  }
}
