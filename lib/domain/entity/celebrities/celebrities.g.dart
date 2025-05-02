// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebrities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelebritiesResponse _$CelebritiesResponseFromJson(Map<String, dynamic> json) =>
    CelebritiesResponse(
      page: (json['page'] as num?)?.toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => CelebrityResults.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CelebritiesResponseToJson(
  CelebritiesResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results.map((e) => e.toJson()).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

CelebrityResults _$CelebrityResultsFromJson(Map<String, dynamic> json) =>
    CelebrityResults(
      adult: json['adult'] as bool,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      mediaType: json['media_type'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor:
          (json['known_for'] as List<dynamic>?)
              ?.map(
                (e) => CelebrityKnownFor.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$CelebrityResultsToJson(CelebrityResults instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'media_type': instance.mediaType,
      'popularity': instance.popularity,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor?.map((e) => e.toJson()).toList(),
    };

CelebrityKnownFor _$CelebrityKnownForFromJson(Map<String, dynamic> json) =>
    CelebrityKnownFor(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      mediaType: json['media_type'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$CelebrityKnownForToJson(CelebrityKnownFor instance) =>
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
    };
