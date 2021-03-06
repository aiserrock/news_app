import 'dart:convert';
import 'package:news_app/data/constants.dart';
import 'package:news_app/data/core/localization_constants.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/domain/entities/future_response.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl extends Repository {
  final NetworkChecker checker;

  RepositoryImpl(this.checker);

  @override
  Future<FutureResponse<NewsResponse>> getEverythingNews({String? qInTitle}) async {
    try {
      if (!await checker.hasInternet) throw ConstantsLocalization.NO_INTERNET;
      final params = {
        'qInTitle': qInTitle,
        'apiKey': Constants.API_KEY,
      };

      var uri = Uri.https(
        Constants.BASE_URL,
        Constants.EVERYTHING_NEWS_ENDPOINT,
        params,
      );
      var response = await http.get(uri);
      if (response.statusCode != 200) throw '';

      var newsResponse = NewsResponse.fromJson(json.decode(response.body));
      return FutureResponse.success(newsResponse);
    } catch (e) {
      return FutureResponse.fail(e.toString());
    }
  }

  @override
  Future<FutureResponse<NewsResponse>> getTopHeadlinesNews() async{
    try {
      if (!await checker.hasInternet) throw ConstantsLocalization.NO_INTERNET;
      final params = {
        'country':'us',
        'apiKey': Constants.API_KEY,
      };

      var uri = Uri.https(
        Constants.BASE_URL,
        Constants.TOP_HEADLINES_NEWS_ENDPOINT,
        params,
      );
      var response = await http.get(uri);
      if (response.statusCode != 200) throw '';

      var newsResponse = NewsResponse.fromJson(json.decode(response.body));
      return FutureResponse.success(newsResponse);
    } catch (e) {
      return FutureResponse.fail(e.toString());
    }
  }
}
