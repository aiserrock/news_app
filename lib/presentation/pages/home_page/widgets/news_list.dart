import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/general_widgets/everything_news_card.dart';
import 'package:news_app/presentation/pages/home_page/bloc/every_news_bloc/every_news_bloc.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final EveryNewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EveryNewsBloc, EveryNewsState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is EveryNewsDataState && state.error != null) {
          // show error
        }
      },
      builder: (context, state) {
        if (state is EveryNewsInitial) {
          return SliverList(delegate: SliverChildListDelegate([]));
        }
        state = state as EveryNewsDataState;
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
