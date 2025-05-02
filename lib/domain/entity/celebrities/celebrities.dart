import 'package:json_annotation/json_annotation.dart';

part 'celebrities.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CelebritiesResponse {
  final int? page;
  final List<CelebrityResults> results;
  final int? totalPages;
  final int? totalResults;

  CelebritiesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CelebritiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CelebritiesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CelebritiesResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CelebrityResults {
  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final String mediaType;
  final double popularity;
  final int gender;
  final String? knownForDepartment;
  final String? profilePath;
  final List<CelebrityKnownFor>? knownFor;

  CelebrityResults({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
  });

  factory CelebrityResults.fromJson(Map<String, dynamic> json) =>
      _$CelebrityResultsFromJson(json);
  Map<String, dynamic> toJson() => _$CelebrityResultsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CelebrityKnownFor {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  CelebrityKnownFor({
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

  factory CelebrityKnownFor.fromJson(Map<String, dynamic> json) =>
      _$CelebrityKnownForFromJson(json);
  Map<String, dynamic> toJson() => _$CelebrityKnownForToJson(this);
}
