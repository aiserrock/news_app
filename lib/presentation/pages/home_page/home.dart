import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/presentation/widgets/home_page/home_bloc/home_bloc.dart';
import 'package:news_app/presentation/widgets/home_page/latest_news_card.dart';
import 'package:news_app/presentation/widgets/home_page/row_with_select_all_button.dart';
import 'package:news_app/presentation/widgets/home_page/search_with_bell.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bloc = HomeBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(HomeInitialLoadEvent());
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    bloc.close();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    var isLoading = false;
    if (bloc.state is HomeDataState) {
      isLoading = (bloc.state as HomeDataState).isLoading;
    }
    if (scrollController.position.extentAfter < 200 && !isLoading) {
      bloc.add(HomeMoreLoadEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWithBell(),
          RowWithSeeAllButton(),
          SizedBox(height: 16),
          Expanded(
            child: BlocConsumer<HomeBloc, HomeState>(
              bloc: bloc,
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
                        scrollDirection: Axis.horizontal,
                        itemCount: articles.length + (state.isLoading ? 1 : 0),
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Row(
                              children: [
                                SizedBox(width: 15),
                                LatestNewsCards(
                                  articles: articles,
                                  index: index,
                                ),
                              ],
                            );
                          }
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
                    Spacer(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
