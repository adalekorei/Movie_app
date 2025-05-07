import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_details.dart';

class TvShowsInfoModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int seriesId;
  TvShowDetails? _tvShowDetails;
  final _dateFormat = DateFormat.yMMMMd();
  bool _isDisposed = false;

  TvShowDetails? get tvShowDetails => _tvShowDetails;

  TvShowsInfoModel(this.seriesId);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadDetails() async {
    _tvShowDetails = await _apiClient.tvShowDetails(
      'en-US',
      seriesId: seriesId,
    );
    safeNotifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void safeNotifyListeners() {
    if (!_isDisposed) notifyListeners();
  }
}
