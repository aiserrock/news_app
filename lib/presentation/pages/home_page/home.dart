import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/data/repositories/repository.dart';
import 'package:news_app/presentation/widgets/home_page/home_bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final bloc = HomeBloc(RepositoryImpl(NetworkCheckerImpl(Connectivity())));
  // final scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   bloc.add(HomeInitialLoadEvent());
  //   scrollController.addListener(_scrollListener);
  // }
  //
  // @override
  // void dispose() {
  //   bloc.close();
  //   scrollController.dispose();
  //   super.dispose();
  // }
  //
  // void _scrollListener() {
  //   var isLoading = false;
  //   if (bloc.state is HomeDataState) {
  //     isLoading = (bloc.state as HomeDataState).isLoading;
  //   }
  //   if (scrollController.position.extentAfter < 200 && !isLoading) {
  //     bloc.add(HomeMoreLoadEvent());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
          ),
          Expanded(child: Container()),
        ],
      ),
      // body: BlocConsumer<HomeBloc, HomeState>(
      //   listener: (context, state) {
      //     if (state is HomeDataState && state.error != null) {
      //       // show error
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is HomeInitial) {
      //       return Container();
      //     }
      //     state = state as HomeDataState;
      //     final articles = state.articles;
      //     return ListView.builder(
      //       itemCount: articles.length + (state.isLoading ? 1 : 0),
      //       controller: scrollController,
      //       itemBuilder: (context, index) {
      //         if(index < articles.length){
      //           return Container();
      //         }
      //         return CircularProgressIndicator();
      //       },
      //     );
      //   },
      // ),
    );
  }
}
