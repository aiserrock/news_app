import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/pages/details_page/detail.dart';
import 'package:news_app/presentation/pages/favorite_page/favorite.dart';
import 'package:news_app/presentation/pages/home_page/home.dart';
import 'package:news_app/presentation/pages/profile/profie.dart';
import 'package:news_app/presentation/pages/search_page/search.dart';
import 'package:news_app/presentation/pages/see_all_page/see_all.dart';
import 'package:news_app/root_navigation.dart';

/// Константы для страниц, здесь должны быть перечислены все страницы без исключений
class Routs{
  static const ROOT = '/';
  static const HOME = '/home';
  static const SEARCH = '/home/search';
  static const DETAILS_FROM_HOME = '/home/details';
  static const SEE_ALL = '/home/seeAll';
  static const FAVORITE = '/favorite';
  static const PROFILE = '/profile';
}

final routes = <String, WidgetBuilder>{
  Routs.ROOT: (_) => RootNavigation(),
  Routs.HOME: (_) => Home(),
  Routs.FAVORITE: (_) => Favorite(),
  Routs.SEARCH: (_) => Search(),
  Routs.PROFILE: (_) => Profile(),
  Routs.DETAILS_FROM_HOME: (_) => Details(),
  Routs.SEE_ALL: (_) => SeeAll(),
};
