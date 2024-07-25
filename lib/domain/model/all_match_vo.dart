import 'package:json_annotation/json_annotation.dart';

part 'all_match_vo.g.dart';

@JsonSerializable()
class AllMatchVo {
  @JsonKey(name: "Title")
  String? title;
  @JsonKey(name: "Matchtime")
  String? matchtime;
  @JsonKey(name: "Venue")
  String? venue;
  @JsonKey(name: "MatchId")
  int? matchId;
  @JsonKey(name: "TeamA")
  String? teamA;
  @JsonKey(name: "TeamB")
  String? teamB;
  @JsonKey(name: "TeamAImage")
  String? teamAImage;
  @JsonKey(name: "Matchtype")
  String? matchtype;
  @JsonKey(name: "TeamBImage")
  String? teamBImage;
  @JsonKey(name: "Result")
  String? result;
  @JsonKey(name: "ImageUrl")
  String? imageUrl;

  AllMatchVo({
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
  });

  factory AllMatchVo.fromJson(Map<String,dynamic> json)=> _$AllMatchVoFromJson(json); 
  Map<String,dynamic> toJson()=> _$AllMatchVoToJson(this); 
}
