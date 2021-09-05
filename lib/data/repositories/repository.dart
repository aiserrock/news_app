import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

class RepositoryImpl extends Repository{
  @override
  Future<NewsResponse> getEverythingNews() {
    // TODO: implement getEverythingNews
    throw UnimplementedError();
  }

  @override
  Future<NewsResponse> getTopHeadlinesNews() {
    // TODO: implement getTopHeadlinesNews
    throw UnimplementedError();
  }

}