import 'package:news_app/domain/entities/news.dart';

abstract class Repository{
  Future<NewsResponse> getEverythingNews();
  Future<NewsResponse> getTopHeadlinesNews();
}