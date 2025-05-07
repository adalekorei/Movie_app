// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_searchbar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowSearchbar _$TvShowSearchbarFromJson(Map<String, dynamic> json) =>
    TvShowSearchbar(
      page: (json['page'] as num?)?.toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Results.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvShowSearchbarToJson(TvShowSearchbar instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
  adult: json['adult'] as bool,
  backdropPath: json['backdrop_path'] as String,
  gendeIds:
      (json['gende_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  id: (json['id'] as num?)?.toInt(),
  originCountry:
      (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  originalLanguage: json['original_language'] as String,
  originalName: json['original_name'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num?)?.toDouble(),
  posterPath: json['poster_path'] as String,
  firstAirDate: json['first_air_date'] as String,
  name: json['name'] as String,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'gende_ids': instance.gendeIds,
  'id': instance.id,
  'origin_country': instance.originCountry,
  'original_language': instance.originalLanguage,
  'original_name': instance.originalName,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'first_air_date': instance.firstAirDate,
  'name': instance.name,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
