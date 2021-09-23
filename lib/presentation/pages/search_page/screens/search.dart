import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/presentation/general_widgets/input_search_widget.dart';
import 'package:news_app/presentation/pages/search_page/widgets/news_card.dart';
import 'package:news_app/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:news_app/styles/styles.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _FilterCarousel(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocConsumer<SearchBloc, SearchState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is SearchDataState && state.error != null) {
                  // show error
                }
              },
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Container();
                }
                state = state as SearchDataState;
                return Text('About ${state.totalResults} results for BitCoin');
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _NewsList(
              bloc: bloc,
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({
    Key? key,
    required this.bloc,
    required this.scrollController,
  }) : super(key: key);

  final SearchBloc bloc;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SearchDataState && state.error != null) {
          // show error
        }
      },
      builder: (context, state) {
        if (state is SearchInitial) {
          return Container();
        }
        state = state as SearchDataState;
        final articles = state.articles;
        return ListView.builder(
          itemCount: articles.length + (state.isLoading ? 1 : 0),
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < articles.length) {
              return NewsCard(
                article: articles[index],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

class _FilterCarousel extends StatelessWidget {
  _FilterCarousel({
    Key? key,
  }) : super(key: key);

  final List<String> items = [
    'Buisness',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        padding: EdgeInsets.only(left: 15, right: 7),
        scrollDirection: Axis.horizontal,
        children: [
          ...items.map((e) => _ChipElement(text: e)),
        ],
      ),
    );
  }
}

class _ChipElement extends StatelessWidget {
  const _ChipElement({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ConstantsButtonStyle.chipNonActive(),
        onPressed: () {
          print(text.toLowerCase());
        },
        child: Text(text),
      ),
    );
  }
}
