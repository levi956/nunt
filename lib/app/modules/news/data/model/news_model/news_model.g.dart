// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      title: json['title'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      urlToImage: json['urlToImage'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
      'description': instance.description,
      'url': instance.url,
      'publishedAt': instance.publishedAt.toIso8601String(),
    };
