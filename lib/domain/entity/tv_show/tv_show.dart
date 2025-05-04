
import 'package:json_annotation/json_annotation.dart';

part 'tv_show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvShow {
  final String? backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final int? voteAverage;
  final int? voteCount;

  TvShow({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

   factory TvShow.fromJson(Map<String, dynamic> json) =>
      _$TvShowFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowToJson(this);
}