
import 'package:json_annotation/json_annotation.dart';

part 'trending_all.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TrendingAll {
  final bool adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int> genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  TrendingAll({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TrendingAll.fromJson(Map<String, dynamic> json) =>
      _$TrendingAllFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingAllToJson(this);
}