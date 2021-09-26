import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/constants.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/presentation/pages/search_page/widgets/filter_carousel.dart';
import 'package:news_app/presentation/general_widgets/input_search_widget.dart';
import 'package:news_app/presentation/general_widgets/everything_news_card.dart';
import 'package:news_app/presentation/pages/search_page/widgets/news_list.dart';
import 'package:news_app/presentation/pages/search_page/bloc/search_bloc.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final bloc = SearchBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(SearchInitialLoadEvent());
    bloc.add(ChooseChipEvent(Constants.SEARCH_THEME.first));
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
    if (bloc.state is SearchDataState) {
      isLoading = (bloc.state as SearchDataState).isLoading;
    }
    if (scrollController.position.extentAfter < 200 && !isLoading) {
      bloc.add(SearchMoreLoadEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleWidget: InputSearchWidget()),
      body: buildScrollable(),
    );
  }

  Widget buildScrollable() {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  FilterCarousel(bloc: bloc),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BlocBuilder<SearchBloc, SearchState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return Text(
                              'About 0 results for ${Constants.SEARCH_THEME.first}');
                        }
                        state = state as SearchDataState;
                        if(state.chipText == 'Filter'){
                          return Container();
                        }
                        return Text(
                            'About ${state.totalResults} results for ${state.chipText}');
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
        NewsList(
          bloc: bloc,
        ),
      ],
    );
  }
}
