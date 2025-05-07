

import 'package:json_annotation/json_annotation.dart';

part 'tv_show_searchbar.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowSearchbar {
  final int? page;
  final List<Results> results;
  final int? totalPages;
  final int? totalResults;

  TvShowSearchbar({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

factory TvShowSearchbar.fromJson(Map<String, dynamic> json) =>
      _$TvShowSearchbarFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowSearchbarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Results{
  final bool adult;
  final String backdropPath;
  final List<int> gendeIds;
  final int? id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double? popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double? voteAverage;
  final int? voteCount;

  Results({
    required this.adult,
    required this.backdropPath,
    required this.gendeIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}