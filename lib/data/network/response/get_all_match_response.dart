
import 'package:json_annotation/json_annotation.dart';
import 'package:livescore/domain/model/all_match_vo.dart';

part 'get_all_match_response.g.dart';

@JsonSerializable()
class GetAllMatchResponse{

  @JsonKey(name: "AllMatch")
  List<AllMatchVo>? allMatches;

  GetAllMatchResponse(
    this.allMatches,
  );

  factory GetAllMatchResponse.fromJson(Map<String,dynamic> json)=>_$GetAllMatchResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$GetAllMatchResponseToJson(this);
}