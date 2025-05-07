// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworksResponse _$NetworksResponseFromJson(Map<String, dynamic> json) =>
    NetworksResponse(
      headquarters: json['headquarters'] as String,
      homepage: json['homepage'] as String,
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logo_path'] as String,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$NetworksResponseToJson(NetworksResponse instance) =>
    <String, dynamic>{
      'headquarters': instance.headquarters,
      'homepage': instance.homepage,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
