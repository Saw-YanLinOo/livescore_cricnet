// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_match_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMatchRequest _$GetAllMatchRequestFromJson(Map<String, dynamic> json) =>
    GetAllMatchRequest(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetAllMatchRequestToJson(GetAllMatchRequest instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
