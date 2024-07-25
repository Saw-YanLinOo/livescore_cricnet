// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_match_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMatchVo _$AllMatchVoFromJson(Map<String, dynamic> json) => AllMatchVo(
      title: json['Title'] as String?,
      matchtime: json['Matchtime'] as String?,
      venue: json['Venue'] as String?,
      matchId: (json['MatchId'] as num?)?.toInt(),
      teamA: json['TeamA'] as String?,
      teamB: json['TeamB'] as String?,
      teamAImage: json['TeamAImage'] as String?,
      matchtype: json['Matchtype'] as String?,
      teamBImage: json['TeamBImage'] as String?,
      result: json['Result'] as String?,
      imageUrl: json['ImageUrl'] as String?,
    );

Map<String, dynamic> _$AllMatchVoToJson(AllMatchVo instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Matchtime': instance.matchtime,
      'Venue': instance.venue,
      'MatchId': instance.matchId,
      'TeamA': instance.teamA,
      'TeamB': instance.teamB,
      'TeamAImage': instance.teamAImage,
      'Matchtype': instance.matchtype,
      'TeamBImage': instance.teamBImage,
      'Result': instance.result,
      'ImageUrl': instance.imageUrl,
    };
