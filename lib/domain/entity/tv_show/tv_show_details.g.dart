// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetails _$TvShowDetailsFromJson(
  Map<String, dynamic> json,
) => TvShowDetails(
  adult: json['adult'] as bool?,
  backdropPath: json['backdrop_path'] as String?,
  createdBy:
      (json['created_by'] as List<dynamic>)
          .map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
  episodeRunTime:
      (json['episode_run_time'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  firstAirDate: json['first_air_date'] as String?,
  genres:
      (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
  homepage: json['homepage'] as String?,
  id: (json['id'] as num?)?.toInt(),
  inProduction: json['in_production'] as bool?,
  languages:
      (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
  lastAirDate: json['last_air_date'] as String?,
  lastEpisodeToAir: LastEpisodeToAir.fromJson(
    json['last_episode_to_air'] as Map<String, dynamic>,
  ),
  name: json['name'] as String?,
  nextEpisodeToAir: json['next_episode_to_air'] as Map<String, dynamic>?,
  networks:
      (json['networks'] as List<dynamic>)
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
  numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt(),
  numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
  originCountry:
      (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  originalLanguage: json['original_language'] as String?,
  originalName: json['original_name'] as String?,
  overview: json['overview'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  posterPath: json['poster_path'] as String?,
  productionCompanies:
      (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
  productionCountries:
      (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountrie.fromJson(e as Map<String, dynamic>))
          .toList(),
  seasons:
      (json['seasons'] as List<dynamic>)
          .map((e) => Seasons.fromJson(e as Map<String, dynamic>))
          .toList(),
  spokenLanguages:
      (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
  tagline: json['tagline'] as String?,
  type: json['type'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
  credits:
      json['credits'] == null
          ? null
          : TvShowDetailsCredits.fromJson(
            json['credits'] as Map<String, dynamic>,
          ),
  videos:
      json['videos'] == null
          ? null
          : TvShowVideos.fromJson(json['videos'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TvShowDetailsToJson(
  TvShowDetails instance,
) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'created_by': instance.createdBy.map((e) => e.toJson()).toList(),
  'episode_run_time': instance.episodeRunTime,
  'first_air_date': instance.firstAirDate,
  'genres': instance.genres.map((e) => e.toJson()).toList(),
  'homepage': instance.homepage,
  'id': instance.id,
  'in_production': instance.inProduction,
  'languages': instance.languages,
  'last_air_date': instance.lastAirDate,
  'last_episode_to_air': instance.lastEpisodeToAir.toJson(),
  'name': instance.name,
  'next_episode_to_air': instance.nextEpisodeToAir,
  'networks': instance.networks.map((e) => e.toJson()).toList(),
  'number_of_episodes': instance.numberOfEpisodes,
  'number_of_seasons': instance.numberOfSeasons,
  'origin_country': instance.originCountry,
  'original_language': instance.originalLanguage,
  'original_name': instance.originalName,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'production_companies':
      instance.productionCompanies.map((e) => e.toJson()).toList(),
  'production_countries':
      instance.productionCountries.map((e) => e.toJson()).toList(),
  'seasons': instance.seasons.map((e) => e.toJson()).toList(),
  'spoken_languages': instance.spokenLanguages.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'tagline': instance.tagline,
  'type': instance.type,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'credits': instance.credits?.toJson(),
  'videos': instance.videos?.toJson(),
};

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
  id: (json['id'] as num?)?.toInt(),
  creditId: json['credit_id'] as String?,
  name: json['name'] as String?,
  gender: (json['gender'] as num?)?.toInt(),
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
  'id': instance.id,
  'credit_id': instance.creditId,
  'name': instance.name,
  'gender': instance.gender,
  'profile_path': instance.profilePath,
};

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) =>
    ProductionCompanies(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompaniesToJson(
  ProductionCompanies instance,
) => <String, dynamic>{
  'id': instance.id,
  'logo_path': instance.logoPath,
  'name': instance.name,
  'origin_country': instance.originCountry,
};

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    Genre(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

LastEpisodeToAir _$LastEpisodeToAirFromJson(Map<String, dynamic> json) =>
    LastEpisodeToAir(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toInt(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num?)?.toInt(),
      episodeType: json['episode_type'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      showId: (json['show_id'] as num?)?.toInt(),
      stillPath: json['still_path'] as String?,
    );

Map<String, dynamic> _$LastEpisodeToAirToJson(LastEpisodeToAir instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
    };

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
  id: (json['id'] as num?)?.toInt(),
  logoPath: json['logo_path'] as String?,
  name: json['name'] as String?,
  originCountry: json['origin_country'] as String?,
);

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
  'id': instance.id,
  'logo_path': instance.logoPath,
  'name': instance.name,
  'origin_country': instance.originCountry,
};

ProductionCountrie _$ProductionCountrieFromJson(Map<String, dynamic> json) =>
    ProductionCountrie(
      iso: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountrieToJson(ProductionCountrie instance) =>
    <String, dynamic>{'iso_3166_1': instance.iso, 'name': instance.name};

Seasons _$SeasonsFromJson(Map<String, dynamic> json) => Seasons(
  airDate: json['air_date'] as String?,
  episodeCount: (json['episode_count'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  voteAverage: (json['vote_average'] as num?)?.toInt(),
);

Map<String, dynamic> _$SeasonsToJson(Seasons instance) => <String, dynamic>{
  'air_date': instance.airDate,
  'episode_count': instance.episodeCount,
  'id': instance.id,
  'name': instance.name,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'season_number': instance.seasonNumber,
  'vote_average': instance.voteAverage,
};

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_3166_1': instance.iso,
      'name': instance.name,
    };
