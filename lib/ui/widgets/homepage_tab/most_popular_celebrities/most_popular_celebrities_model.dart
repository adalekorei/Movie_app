import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/celebrities/celebrities.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class MostPopularCelebritiesModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _popularCelebrities = <CelebrityResults>[];
  List<CelebrityResults> get results => List.unmodifiable(_popularCelebrities);

  Future<void> loadCelebrities() async {
    final resultsResponse = await _apiClient.popularCelebrities(
      'en-US',
      time_window: 'week',
    );
    _popularCelebrities.addAll(resultsResponse.results);
    notifyListeners();
  }

  void onCelebrityTap(BuildContext context, int index) {
    final id = _popularCelebrities[index].id;
    Navigator.of(
      context,
    ).pushNamed(MainNavigationRoutes.celebritiesInfo, arguments: id);
  }
}
