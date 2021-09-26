import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:news_app/presentation/general_widgets/everything_news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({
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
          padding: EdgeInsets.only(bottom: 8),
          itemCount: articles.length + (state.isLoading ? 1 : 0),
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < articles.length) {
              return EverythingNewsCard(
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