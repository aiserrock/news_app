import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/pages/details_page/screens/detail.dart';
import 'package:news_app/presentation/pages/favorite_page/screens/favorite.dart';
import 'package:news_app/presentation/pages/home_page/screens/home.dart';
import 'package:news_app/presentation/pages/profile/screens/profie.dart';
import 'package:news_app/presentation/pages/search_page/screens/search.dart';
import 'package:news_app/presentation/pages/see_all_page/screens/see_all.dart';
import 'package:news_app/presentation/navigator/root_navigation.dart';

/// Константы для страниц, здесь должны быть перечислены все страницы без исключений
class Routs{
  static const ROOT = '/';
  static const HOME = '/home';
  static const SEARCH = '/home/search';
  static const DETAILS_FROM_HOME = '/home/details';
  static const DETAILS_FROM_SEE_ALL = '/home/seeAll/details';
  static const SEE_ALL = '/home/seeAll';
  static const FAVORITE = '/favorite';
  static const PROFILE = '/profile';
}

/// Роуты, в которые не нужно передавать данные, они основаны на DI
final routes = <String, WidgetBuilder>{
  Routs.ROOT: (_) => RootNavigation(),
  Routs.HOME: (_) => Home(),
  Routs.FAVORITE: (_) => Favorite(),
  Routs.SEARCH: (_) => Search(),
  Routs.PROFILE: (_) => Profile(),
  Routs.SEE_ALL: (_) => SeeAll(),
};

/// Роуты, в которые необходимо передавать данные.
/// Каждый MaterialPageRoute должен содержать параметр [settings], определяющий
/// его назначение.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routs.DETAILS_FROM_HOME:
      return MaterialPageRoute(
        builder: (_) => Details(article: settings.arguments as Article,),
        settings: settings,
      );
    case Routs.DETAILS_FROM_SEE_ALL:
      return MaterialPageRoute(
        builder: (_) => Details(article: settings.arguments as Article,),
        settings: settings,
      );
    default:
      throw Exception("Route with name ${settings.name} doesn't exists");
  }
}
