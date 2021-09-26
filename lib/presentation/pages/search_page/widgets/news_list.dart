import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:news_app/presentation/general_widgets/everything_news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final SearchBloc bloc;

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
          return SliverList(delegate: SliverChildListDelegate([]));
        }
        state = state as SearchDataState;
        final articles = state.articles;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index < articles.length) {
                return EverythingNewsCard(
                  article: articles[index],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
            childCount: articles.length + (state.isLoading ? 1 : 0),
          ),
        );
      },
    );
  }
}
