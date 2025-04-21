import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/movies.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularMoviesResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<Movies> movies;
  final int totalResults;
  final int totalPages;

  PopularMoviesResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}
