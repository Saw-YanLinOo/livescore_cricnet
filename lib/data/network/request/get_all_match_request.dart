import 'package:json_annotation/json_annotation.dart';

part 'get_all_match_request.g.dart';

@JsonSerializable()
class GetAllMatchRequest {
  @JsonKey(name: "start")
  int? start;

  @JsonKey(name: "end")
  int? end;

  GetAllMatchRequest({
    this.start,
    this.end,
  });

  factory GetAllMatchRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllMatchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllMatchRequestToJson(this);
}
