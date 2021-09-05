import 'package:news_app/domain/entities/future_response.dart';
import 'package:news_app/domain/entities/news.dart';

abstract class Repository{
  Future<FutureResponse<List<Article>>> getEverythingNews();
  Future<FutureResponse<List<Article>>> getTopHeadlinesNews();
}