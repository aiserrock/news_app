import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/presentation/pages/home_page/bloc/every_news_bloc/every_news_bloc.dart';
import 'package:news_app/presentation/pages/home_page/bloc/latest_news_bloc/home_bloc.dart';
import 'package:news_app/presentation/pages/home_page/widgets/filter_carousel.dart';
import 'package:news_app/presentation/pages/home_page/widgets/latest_news_card.dart';
import 'package:news_app/presentation/pages/home_page/widgets/news_list.dart';
import 'package:news_app/presentation/pages/home_page/widgets/row_with_select_all_button.dart';
import 'package:news_app/presentation/pages/home_page/widgets/search_with_bell.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final blocHorizontalNews =
      HomeBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  final blocVerticalNews =
      EveryNewsBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  final scrollControllerMain = ScrollController();
  final scrollControllerHorizontal = ScrollController();

  @override
  void initState() {
    super.initState();
    blocHorizontalNews.add(HomeInitialLoadEvent());
    blocVerticalNews.add(EveryNewsInitialLoadEvent());
    scrollControllerMain.addListener(_scrollListenerMain);
    scrollControllerHorizontal.addListener(_scrollListenerHorizontal);
  }

  @override
  void dispose() {
    blocHorizontalNews.close();
    blocVerticalNews.close();
    scrollControllerMain.dispose();
    scrollControllerHorizontal.dispose();
    super.dispose();
  }

  void _scrollListenerMain() {
    var isLoading = false;
    if (blocHorizontalNews.state is HomeDataState) {
      isLoading = (blocHorizontalNews.state as HomeDataState).isLoading;
    }
    if (scrollControllerMain.position.extentAfter < 200 && !isLoading) {
      blocHorizontalNews.add(HomeMoreLoadEvent());
    }
  }

  void _scrollListenerHorizontal() {
    var isLoading = false;
    if (blocVerticalNews.state is EveryNewsDataState) {
      isLoading = (blocHorizontalNews.state as EveryNewsDataState).isLoading;
    }
    if (scrollControllerMain.position.extentAfter < 200 && !isLoading) {
      blocVerticalNews.add(EveryNewsMoreLoadEvent());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollControllerMain,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SearchWithBell(),
                RowWithSeeAllButton(),
                SizedBox(height: 16),
                BlocConsumer<HomeBloc, HomeState>(
                  bloc: blocHorizontalNews,
                  listener: (context, state) {
                    if (state is HomeDataState && state.error != null) {
                      // show error
                    }
                  },
                  builder: (context, state) {
                    if (state is HomeInitial) {
                      return Container();
                    }
                    state = state as HomeDataState;
                    final articles = state.articles;
                    return Column(
                      children: [
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 15, right: 7),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                articles.length + (state.isLoading ? 1 : 0),
                            controller: scrollControllerHorizontal,
                            itemBuilder: (context, index) {
                              if (index < articles.length) {
                                return LatestNewsCards(
                                  articles: articles,
                                  index: index,
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        FilterCarousel(bloc: blocVerticalNews),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          NewsList(
            bloc: blocVerticalNews,
          ),
        ],
      ),
    );
  }
}
