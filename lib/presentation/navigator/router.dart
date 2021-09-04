import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/pages/favorite_page/favorite.dart';
import 'package:news_app/presentation/pages/home_page/home.dart';
import 'package:news_app/presentation/pages/search_page/search.dart';

/// Константы для страниц, здесь должны быть перечислены все страницы без исключений
const HOME = '/home';
const FAVORITE = '/favorite';
const SEARCH = '/search';

final routes = <String,WidgetBuilder>{
  HOME:(_) => Home(),
  FAVORITE:(_) => Favorite(),
  SEARCH:(_) => Search(),
};