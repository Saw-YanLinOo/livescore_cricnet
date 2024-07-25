// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_match_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveMatchVo _$LiveMatchVoFromJson(Map<String, dynamic> json) => LiveMatchVo(
      title: json['Title'] as String?,
      matchtime: json['Matchtime'] as String?,
      venue: json['venue'] as String?,
      matchId: (json['MatchId'] as num?)?.toInt(),
      teamA: json['TeamA'] as String?,
      teamB: json['TeamB'] as String?,
      teamAImage: json['TeamAImage'] as String?,
      matchtype: json['MatchType'] as String?,
      teamBImage: json['TeamBImage'] as String?,
      result: json['Result'] as String?,
      imageUrl: json['ImgeURL'] as String?,
      seriesId: (json['seriesid'] as num?)?.toInt(),
      isFinished: (json['isfinished'] as num?)?.toInt(),
      isPriority: (json['ispriority'] as num?)?.toInt(),
      matchdate: json['MatchDate'] as String?,
    );

Map<String, dynamic> _$LiveMatchVoToJson(LiveMatchVo instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Matchtime': instance.matchtime,
      'MatchDate': instance.matchdate,
      'venue': instance.venue,
      'Result': instance.result,
      'isfinished': instance.isFinished,
      'ispriority': instance.isPriority,
      'MatchId': instance.matchId,
      'TeamA': instance.teamA,
      'TeamB': instance.teamB,
      'TeamAImage': instance.teamAImage,
      'MatchType': instance.matchtype,
      'TeamBImage': instance.teamBImage,
      'ImgeURL': instance.imageUrl,
      'seriesid': instance.seriesId,
    };
