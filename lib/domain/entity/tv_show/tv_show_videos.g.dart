// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowVideos _$TvShowVideosFromJson(Map<String, dynamic> json) => TvShowVideos(
  results:
      (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$TvShowVideosToJson(TvShowVideos instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
  iso: json['iso_639_1'] as String,
  iso2: json['iso_3166_1'] as String,
  name: json['name'] as String,
  key: json['key'] as String,
  site: json['site'] as String,
  size: (json['size'] as num?)?.toInt(),
  type: json['type'] as String,
  official: json['official'] as bool,
  publishedAt: json['published_at'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
  'iso_639_1': instance.iso,
  'iso_3166_1': instance.iso2,
  'name': instance.name,
  'key': instance.key,
  'site': instance.site,
  'size': instance.size,
  'type': instance.type,
  'official': instance.official,
  'published_at': instance.publishedAt,
  'id': instance.id,
};
