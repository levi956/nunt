// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      title: json['title'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      urlToImage: json['urlToImage'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
      'description': instance.description,
      'url': instance.url,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
