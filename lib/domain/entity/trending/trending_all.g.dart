// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingAll _$TrendingAllFromJson(Map<String, dynamic> json) => TrendingAll(
  adult: json['adult'] as bool?,
  backdropPath: json['backdrop_path'] as String?,
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  originalLanguage: json['original_language'] as String?,
  originalTitle: json['original_title'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  mediaType: json['media_type'] as String?,
  genreIds:
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  popularity: (json['popularity'] as num?)?.toDouble(),
  releaseDate: json['release_date'] as String?,
  video: json['video'] as bool?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
  originalName: json['original_name'] as String?,
);

Map<String, dynamic> _$TrendingAllToJson(TrendingAll instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'original_name': instance.originalName,
    };
