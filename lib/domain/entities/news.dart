import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse(
    this.articles,
    this.status,
    this.totalResults,
  );

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@JsonSerializable()
class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@JsonSerializable()
class Source {
  final String id;
  final String name;

  Source(
    this.id,
    this.name,
  );

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
