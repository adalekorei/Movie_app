import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/trending/trending_all.dart';

part 'trending_all_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TrendingAllResponse {
  final int? page;
  @JsonKey(name: 'results')
  final List<TrendingAll> moviesAndTvShows;
  final int? totalPages;
  final int? totalResults;

  TrendingAllResponse({
    required this.page,
    required this.moviesAndTvShows,
    required this.totalPages,
    required this.totalResults,
  });

factory TrendingAllResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingAllResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingAllResponseToJson(this);
}