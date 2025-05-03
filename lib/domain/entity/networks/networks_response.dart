
import 'package:json_annotation/json_annotation.dart';

part 'networks_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworksResponse {
  final String headquarters;
  final String homepage;
  final int? id;
  final String logoPath;
  final String name;
  final String originCountry;

  NetworksResponse({
    required this.headquarters,
    required this.homepage,
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,

  });

  factory NetworksResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworksResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NetworksResponseToJson(this);
}