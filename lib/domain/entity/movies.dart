import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/movie_date_parser.dart';

part 'movies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Movies {

  final String? posterPath;
  final bool adult;
  final String overview;
  @JsonKey(fromJson: parseMovieDateFromString)
  final DateTime? releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movies({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);

}