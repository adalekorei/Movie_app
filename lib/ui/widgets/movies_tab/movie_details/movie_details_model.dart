import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/data_providers/session_data_provider.dart';
import 'package:movie_app/domain/entity/movies/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final int movieId;
  MovieDetails? _movieDetails;
  bool _isMovieFavorite = false;
  String _local = '';
  late DateFormat _dateFormat;
  Future<void>? Function()? onSessionExpired;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isMovieFavorite => _isMovieFavorite;

  MovieDetailsModel(this.movieId);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocal(BuildContext context) async {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _dateFormat = DateFormat.yMMMMd(local);
    await loadDetails();
  }

Future<void> loadDetails() async {
  try {
    _movieDetails = await _apiClient.movieDetails(movieId, _local);
    final sessionId = await _sessionDataProvider.getSessionId();
    if (sessionId != null) {
      _isMovieFavorite = await _apiClient.isMovieFavorite(movieId, sessionId);
    }
    notifyListeners();
  } on ApiClientException catch (e) {
    _handleApiClientException(e);
  }
}

Future<void> switchFavorite() async {
  final sessionId = await _sessionDataProvider.getSessionId();
  final accountId = await _sessionDataProvider.getAccountId();

  if (sessionId == null || accountId == null) return;

  _isMovieFavorite = !_isMovieFavorite;
  notifyListeners();
  try {
    await _apiClient.markedAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      mediaType: MediaType.Movie,
      mediaId: movieId,
      isFavorite: _isMovieFavorite,
    );
  } on ApiClientException catch (e) {
    _handleApiClientException(e);
  }
}

  void _handleApiClientException(ApiClientException exception) {
    switch (exception.type) {
      case ApiClientExceptionType.SessionExpired:
        onSessionExpired?.call();
        break;
      default:
        print(exception);
    }
  }
}
