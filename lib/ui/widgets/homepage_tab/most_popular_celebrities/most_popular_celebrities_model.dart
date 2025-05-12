import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/celebrities/celebrities.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class MostPopularCelebritiesModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _popularCelebrities = <CelebrityResults>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;

  List<CelebrityResults> get results => List.unmodifiable(_popularCelebrities);

  void setupPagination(BuildContext context) {
    _currentPage = 0;
    _totalPage = 1;
    _popularCelebrities.clear();
    _loadCelebrities();
  }

  Future<void> _loadCelebrities() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final resultsResponse = await _apiClient.popularCelebrities(
        'en-US',
        time_window: 'week',
        nextPage,
      );
      _popularCelebrities.addAll(resultsResponse.results);
      _currentPage = resultsResponse.page ?? 0;
      _totalPage = resultsResponse.totalPages ?? 0;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void shownCelebrityAtIndex(int index) {
    if (index < _popularCelebrities.length - 1) return;
    _loadCelebrities();
  }
}
