// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_new_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewResponse _$GetNewResponseFromJson(Map<String, dynamic> json) =>
    GetNewResponse(
      (json['articles'] as List<dynamic>?)
          ?.map((e) => NewVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..totalResults = (json['totalResults'] as num?)?.toInt();

Map<String, dynamic> _$GetNewResponseToJson(GetNewResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'articles': instance.allMatches,
    };
