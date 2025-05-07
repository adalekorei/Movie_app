import 'package:json_annotation/json_annotation.dart';

part 'trailers.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TrailersResponse {
  final DatesRange dates;
  final int page;
  final List<Results> results;

  TrailersResponse({
    required this.dates,
    required this.page,
    required this.results,
  });

  factory TrailersResponse.fromJson(Map<String, dynamic> json) =>
      _$TrailersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TrailersResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DatesRange {
  final String maximum;
  final String minimum;

  DatesRange({required this.maximum, required this.minimum});

  factory DatesRange.fromJson(Map<String, dynamic> json) => _$DatesRangeFromJson(json);
  Map<String, dynamic> toJson() => _$DatesRangeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Results {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int? id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double? popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double? voteAverage;
  final int? voteCount;

  Results({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
