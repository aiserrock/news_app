import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/helpers/error_image.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/domain/entities/convertrs/custom_date_time_converter.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/presentation/navigator/router.dart';
import 'package:news_app/presentation/pages/home_page/bloc/latest_news_bloc/home_bloc.dart';
import 'package:news_app/presentation/pages/see_all_page/bloc/see_all_bloc.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';
import 'package:news_app/data/extentions/power_string.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  final bloc = SeeAllBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(SeeAllInitialLoadEvent());
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
    if (bloc.state is SeeAllDataState) {
      isLoading = (bloc.state as SeeAllDataState).isLoading;
    }
    if (scrollController.position.extentAfter < 200 && !isLoading) {
      bloc.add(SeeAllMoreLoadEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hot Updates'),
      body: BlocConsumer<SeeAllBloc, SeeAllState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SeeAllDataState && state.error != null) {
            // show error
          }
        },
        builder: (context, state) {
          if (state is SeeAllInitial) {
            return Container();
          }
          state = state as SeeAllDataState;
          final articles = state.articles;
          return ListView.builder(
            padding: EdgeInsets.only(top: 16),
            itemCount: articles.length + (state.isLoading ? 1 : 0),
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < articles.length) {
                return HotUpdateCard(article: articles[index]);
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

class HotUpdateCard extends StatelessWidget {
  const HotUpdateCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, left: 15, right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 128,
              child: Image.network(
                article.urlToImage ?? '',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                errorBuilder: (context, error, stackTrace) {
                  return errorImage(context);
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          TextContentWidget(article: article),
        ],
      ),
    );
  }
}

class TextContentWidget extends StatelessWidget {
  const TextContentWidget({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final author = article.author != null
        ? 'Published by ${article.author}'
        : 'Author not founded';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CustomDateTimeConverter.stringFromDate(article.publishedAt),
          style: ConstantsTextStyle.tsNunitoBold12,
        ),
        SizedBox(height: 4),
        Text(
          article.title ?? 'No title found',
          style: ConstantsTextStyle.tsNewYorkSmallSemibold14,
        ),
        SizedBox(height: 8),
        setContent(context),
        SizedBox(height: 8),
        Text(
          author,
          style: ConstantsTextStyle.tsNunitoBold12,
        ),
      ],
    );
  }

  RichText setContent(BuildContext context) {
    final RichText content;
    if (article.content != null) {
      content = RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: article.content!.removeLast(),
              style: ConstantsTextStyle.tsNunitoSemiBold14,
            ),
            TextSpan(
              text: 'Read More',
              style: ConstantsTextStyle.tsNunitoSemiBold14Blue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(
                    Routs.DETAILS_FROM_SEE_ALL,
                    arguments: article,
                  );
                },
            ),
          ],
        ),
      );
    } else {
      content = RichText(
        text: const TextSpan(
          text: 'Content not found',
          style: ConstantsTextStyle.tsNunitoSemiBold14,
        ),
      );
    }
    return content;
  }
}
