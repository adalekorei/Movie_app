import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/trailers/trailers.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TrailersModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _trailers = <Results>[];
  late int _currentPage;

  var _isLoadingInProgress = false;

  List<Results> get trailers => List.unmodifiable(_trailers);

  void setupPagination(BuildContext context) {
    _currentPage = 0;
    _trailers.clear();
    _loadTrailers();
  }

  Future<void> _loadTrailers() async {
    if (_isLoadingInProgress) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final trailersResponse = await _apiClient.popularTrailers('en-US', nextPage);
      _trailers.addAll(trailersResponse.results);
      _currentPage = trailersResponse.page;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onTrailerTap(BuildContext context, int index) {
    final id = _trailers[index].id;
    Navigator.of(context).pushNamed(MainNavigationRoutes.trailersInfo);
  }

  void shownTrailerAtIndex(int index) {
    if (index < _trailers.length - 1) return;
    _loadTrailers();
  }
}
