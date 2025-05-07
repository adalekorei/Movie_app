import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_details_credits.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_videos.dart';

part 'tv_show_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowDetails {
  final bool? adult;
  final String? backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final String? firstAirDate;
  final List<Genre> genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String> languages;
  final String? lastAirDate;
  final LastEpisodeToAir lastEpisodeToAir;
  final String? name;
  final Map<String, dynamic>? nextEpisodeToAir;
  final List<Network> networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountrie> productionCountries;
  final List<Seasons> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final TvShowDetailsCredits? credits;
  final TvShowVideos? videos;

  TvShowDetails({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.credits,
    required this.videos,
  });

  factory TvShowDetails.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreatedBy{
final int? id;
final String? creditId;
final String? name;
final int? gender;
final String? profilePath;

CreatedBy({
  required this.id,
  required this.creditId,
  required this.name,
  required this.gender,
  required this.profilePath,
});

factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductionCompanies{
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({
    required this.id, 
     required this.logoPath,
      required this.name,
       required this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Genre {
  final int? id;
  final String? name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LastEpisodeToAir {
  final int? id;
  final String? name;
  final String? overview;
  final int? voteAverage;
  final int? voteCount;
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);
  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Network {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductionCountrie {
  @JsonKey(name: 'iso_3166_1')
  final String? iso;
  final String? name;

  ProductionCountrie({required this.iso, required this.name});

  factory ProductionCountrie.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountrieFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountrieToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Seasons {
  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final int? voteAverage;

  Seasons({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) =>
      _$SeasonsFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SpokenLanguage {
  final String? englishName;
  @JsonKey(name: 'iso_3166_1')
  final String? iso;
  final String? name;

  SpokenLanguage({
    required this.englishName,
    required this.iso,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
