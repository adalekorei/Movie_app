// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingAllResponse _$TrendingAllResponseFromJson(Map<String, dynamic> json) =>
    TrendingAllResponse(
      page: (json['page'] as num?)?.toInt(),
      moviesAndTvShows:
          (json['results'] as List<dynamic>)
              .map((e) => TrendingAll.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrendingAllResponseToJson(
  TrendingAllResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.moviesAndTvShows.map((e) => e.toJson()).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};
