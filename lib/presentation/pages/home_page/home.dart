import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/presentation/general_widgets/custom_search.dart';
import 'package:news_app/presentation/widgets/home_page/home_bloc/home_bloc.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(child: CustomSearch()),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstantsColor.kPrimary,
                        ),
                        child: SvgPicture.asset(
                          Svgs.bell,
                          height: 16,
                          width: 13,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
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

class LatestNewsCards extends StatelessWidget {
  const LatestNewsCards({
    Key? key,
    required this.articles,
    required this.index,
  }) : super(key: key);

  final List<Article> articles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.856,
          child: Stack(
            children: [
              Image.network(
                articles[index].urlToImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.856,
                height: 240,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // from bottom to center
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    // from black to transparent black
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(98, 98, 98, 0.35),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  right: 8,
                  left: 8,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'by ${articles[index].author}',
                      style: ConstantsTextStyle.tsNunitoReguler10,
                    ),
                    Text(articles[index].title,
                        style: ConstantsTextStyle.tsNewYorkSmallSemibold16),
                    SizedBox(height: 32),
                    Text(
                      articles[index].description ?? '',
                      style: ConstantsTextStyle.tsNunitoLight10,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
