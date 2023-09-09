import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    String? title,
    String? author,
    String? content,
    String? urlToImage,
    String? description,
    String? url,
    DateTime? publishedAt,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, Object?> json) =>
      _$NewsModelFromJson(json);
}

const defaultImage =
    'https://cdn.pixabay.com/photo/2016/02/01/00/56/news-1172463__480.jpg';
