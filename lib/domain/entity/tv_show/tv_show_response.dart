import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show.dart';

part 'tv_show_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowResponse {
  final int? page;
  @JsonKey(name: 'results')
  final List<TvShow> tvShows;
  final int? totalPages;
  final int? totalResults;

  TvShowResponse({
    required this.page,
    required this.tvShows,
    required this.totalPages,
    required this.totalResults,
  });

factory TvShowResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowResponseToJson(this);
}