// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailersResponse _$TrailersResponseFromJson(Map<String, dynamic> json) =>
    TrailersResponse(
      dates: DatesRange.fromJson(json['dates'] as Map<String, dynamic>),
      page: (json['page'] as num).toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Results.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$TrailersResponseToJson(TrailersResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates.toJson(),
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

DatesRange _$DatesRangeFromJson(Map<String, dynamic> json) => DatesRange(
  maximum: json['maximum'] as String,
  minimum: json['minimum'] as String,
);

Map<String, dynamic> _$DatesRangeToJson(DatesRange instance) =>
    <String, dynamic>{'maximum': instance.maximum, 'minimum': instance.minimum};

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
  adult: json['adult'] as bool,
  backdropPath: json['backdrop_path'] as String,
  genreIds:
      (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  id: (json['id'] as num?)?.toInt(),
  originalLanguage: json['original_language'] as String,
  originalTitle: json['original_title'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num?)?.toDouble(),
  posterPath: json['poster_path'] as String,
  releaseDate: json['release_date'] as String,
  title: json['title'] as String,
  video: json['video'] as bool,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'genre_ids': instance.genreIds,
  'id': instance.id,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'release_date': instance.releaseDate,
  'title': instance.title,
  'video': instance.video,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
