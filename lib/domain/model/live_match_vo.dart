import 'package:json_annotation/json_annotation.dart';
import 'package:livescore/domain/model/all_match_vo.dart';

part 'live_match_vo.g.dart';

@JsonSerializable()
class LiveMatchVo {
  @JsonKey(name: "Title")
  String? title;
  @JsonKey(name: "Matchtime")
  String? matchtime;
  @JsonKey(name: "MatchDate")
  String? matchdate;
  @JsonKey(name: "venue")
  String? venue;
  @JsonKey(name: "Result")
  String? result;
  @JsonKey(name: "isfinished")
  int? isFinished;
  @JsonKey(name: "ispriority")
  int? isPriority;
  @JsonKey(name: "MatchId")
  int? matchId;
  @JsonKey(name: "TeamA")
  String? teamA;
  @JsonKey(name: "TeamB")
  String? teamB;
  @JsonKey(name: "TeamAImage")
  String? teamAImage;
  @JsonKey(name: "MatchType")
  String? matchtype;
  @JsonKey(name: "TeamBImage")
  String? teamBImage;
  @JsonKey(name: "ImgeURL")
  String? imageUrl;
  @JsonKey(name: "seriesid")
  int? seriesId;

  LiveMatchVo({
    this.title,
    this.matchtime,
    this.venue,
    this.matchId,
    this.teamA,
    this.teamB,
    this.teamAImage,
    this.matchtype,
    this.teamBImage,
    this.result,
    this.imageUrl,
    this.seriesId,
    this.isFinished,
    this.isPriority,
    this.matchdate,
  });

  factory LiveMatchVo.fromJson(Map<String, dynamic> json) =>
      _$LiveMatchVoFromJson(json);
  Map<String, dynamic> toJson() => _$LiveMatchVoToJson(this);

  AllMatchVo toAllMatchVO() {
    return AllMatchVo(
      matchId: matchId,
      imageUrl: imageUrl,
      matchtime: matchtime,
      matchtype: matchtime,
      result: result,
      teamA: teamA,
      teamAImage: teamAImage,
      teamB: teamB,
      teamBImage: teamBImage,
      title: title,
      venue: venue,
    );
  }
}

 // "Title": "2nd Match The Hundred Mens Competition 2024",
  //       "Matchtime": "24-Jul-2024 at 11:00PM-Wed",
  //       "venue": "The Rose Bowl, Southampton ",
  //       "Result": "Southern Brave Won by 7 Wickets",
  //       "isfinished": 0,
  //       "ispriority": 0,
  //       "TeamA": "Southern Brave",
  //       "TeamAImage": "Southern_Brave.jpg",
  //       "TeamB": "London Spirit",
  //       "seriesid": 3357,
  //       "TeamBImage": "London_Spirit.png",
  //       "ImgeURL": "http://cricnet.co.in/ManagePlaying/TeamImages/thumb/",
  //       "MatchType": "T20",
  //       "MatchDate": "24-07-2024",
  //       "MatchId": 12536,
  //       "Appversion": null,
  //       "adphone": "https://wa.me/918750375271",
  //       "adimage": "http://cricnet.co.in/adimages/30082023125102WhatsApp_Image_2023-03-30_at_11.05.12.jpeg",
  //       "admsg": ""