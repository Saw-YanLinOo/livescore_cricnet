
import 'package:json_annotation/json_annotation.dart';
import 'package:livescore/domain/model/new_vo.dart';

part 'get_new_response.g.dart';

@JsonSerializable()
class GetNewResponse{

  @JsonKey(name: "totalResults")
  int? totalResults;

  @JsonKey(name: "articles")
  List<NewVo>? allMatches;

  GetNewResponse(
    this.allMatches,
  );

  factory GetNewResponse.fromJson(Map<String,dynamic> json)=>_$GetNewResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$GetNewResponseToJson(this);
}