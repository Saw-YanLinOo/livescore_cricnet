// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewVo _$NewVoFromJson(Map<String, dynamic> json) => NewVo(
      source: json['Source'] == null
          ? null
          : SourceVo.fromJson(json['Source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$NewVoToJson(NewVo instance) => <String, dynamic>{
      'Source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

SourceVo _$SourceVoFromJson(Map<String, dynamic> json) => SourceVo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceVoToJson(SourceVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
