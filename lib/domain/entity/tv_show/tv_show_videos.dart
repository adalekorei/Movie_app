import 'package:json_annotation/json_annotation.dart';

part 'tv_show_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowVideos {
  final List<Results> results;

  TvShowVideos({
    required this.results,
  });
  factory TvShowVideos.fromJson(Map<String, dynamic> json) =>
      _$TvShowVideosFromJson(json);
  Map<String, dynamic> toJson() => _$TvShowVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Results{
  @JsonKey(name: 'iso_639_1')
  final String iso;
  @JsonKey(name: 'iso_3166_1')
  final String iso2;
  final String name;
  final String key;
  final String site;
  final int? size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  Results({
required this.iso,
required this.iso2,
required this.name,
required this.key,
required this.site,
required this.size,
required this.type,
required this.official,
required this.publishedAt,
required this.id,
   });

   factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}