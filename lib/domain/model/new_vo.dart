import 'package:json_annotation/json_annotation.dart';

part 'new_vo.g.dart';

@JsonSerializable()
class NewVo {
  @JsonKey(name: "Source")
  SourceVo? source;

  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  String? publishedAt;
  @JsonKey(name: "content")
  String? content;

  NewVo({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

   factory NewVo.fromJson(Map<String, dynamic> json) =>
      _$NewVoFromJson(json);
  Map<String, dynamic> toJson() => _$NewVoToJson(this);


}

@JsonSerializable()
class SourceVo {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  SourceVo({
    this.id,
    this.name,
  });

   factory SourceVo.fromJson(Map<String, dynamic> json) =>
      _$SourceVoFromJson(json);
  Map<String, dynamic> toJson() => _$SourceVoToJson(this);

}
