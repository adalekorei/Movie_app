// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponse _$PopularMoviesResponseFromJson(
  Map<String, dynamic> json,
) => PopularMoviesResponse(
  page: (json['page'] as num).toInt(),
  movies:
      (json['results'] as List<dynamic>)
          .map((e) => Movies.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalResults: (json['total_results'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$PopularMoviesResponseToJson(
  PopularMoviesResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.movies.map((e) => e.toJson()).toList(),
  'total_results': instance.totalResults,
  'total_pages': instance.totalPages,
};
