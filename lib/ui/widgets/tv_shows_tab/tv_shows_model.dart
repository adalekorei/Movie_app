import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class TvShowsModel extends ChangeNotifier{
  final _apiClient = ApiClient();
  final _tvShows = <TvShow>[];
  List<TvShow> get tvShows => List.unmodifiable(_tvShows);
  final _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) => date != null ? _dateFormat.format(date) : '';

  Future<void> loadTvShows() async {
    final tvShowResponse = await _apiClient.popularTvShows('en-US', 1);
    _tvShows.addAll(tvShowResponse.tvShows);
    notifyListeners();
  }

  void onTvShowTap(BuildContext context, int index){
    final id = _tvShows[index].id;
    Navigator.of(context).pushNamed(MainNavigationRoutes.tvShowsInfo, arguments: id);

  }
}