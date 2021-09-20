import 'package:news_app/domain/entities/future_response.dart';
import 'package:news_app/domain/entities/news.dart';

abstract class Repository{
  Future<FutureResponse<NewsResponse>> getEverythingNews();
  Future<FutureResponse<NewsResponse>> getTopHeadlinesNews();
}