import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/trailers/trailers.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TrailersModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _trailers = <Results>[];
  List<Results> get trailers => List.unmodifiable(_trailers);

  Future<void> loadTrailers() async {
    final trailersResponse = await _apiClient.popularTrailers('en-US', 1);
    _trailers.addAll(trailersResponse.results);
    notifyListeners();
  }

  void onTrailerTap(BuildContext context, int index) {
    final id = _trailers[index].id;
    Navigator.of(context).pushNamed(MainNavigationRoutes.trailersInfo);
  }
}
