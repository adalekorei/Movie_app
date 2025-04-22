import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final int movieId;
  MovieDetails? _movieDetails;
  String _local = '';
  late DateFormat _dateFormat;

  MovieDetails? get movieDetails => _movieDetails;

  MovieDetailsModel(this.movieId);

  Future<void> setupLocal(BuildContext context) async {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _dateFormat = DateFormat.yMMMMd(local);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId, _local);
    notifyListeners();
  }
}
