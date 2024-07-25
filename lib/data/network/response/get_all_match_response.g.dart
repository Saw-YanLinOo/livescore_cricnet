// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_match_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMatchResponse _$GetAllMatchResponseFromJson(Map<String, dynamic> json) =>
    GetAllMatchResponse(
      (json['AllMatch'] as List<dynamic>?)
          ?.map((e) => AllMatchVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllMatchResponseToJson(
        GetAllMatchResponse instance) =>
    <String, dynamic>{
      'AllMatch': instance.allMatches,
    };
