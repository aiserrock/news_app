import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/constants.dart';
import 'package:news_app/presentation/pages/search_page/bloc/search_bloc.dart';
import 'package:news_app/styles/styles.dart';

class FilterCarousel extends StatelessWidget {
  FilterCarousel({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final SearchBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        padding: EdgeInsets.only(left: 15, right: 7),
        scrollDirection: Axis.horizontal,
        children: [
          ...Constants.SEARCH_THEME
              .map((e) => _ChipElement(text: e, bloc: bloc)),
        ],
      ),
    );
  }
}

class _ChipElement extends StatelessWidget {
  const _ChipElement({
    Key? key,
    required this.text,
    required this.bloc,
  }) : super(key: key);

  final String text;
  final SearchBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        var style = ConstantsButtonStyle.chipNonActive();
        if (bloc.state is SearchDataState) {
          if ((bloc.state as SearchDataState).chipText == text) {
            style = ConstantsButtonStyle.chipActive();
          }
        }
        return Padding(
          padding: EdgeInsets.only(right: 8),
          child: ElevatedButton(
            style: style,
            onPressed: () {
              bloc.add(ChooseChipEvent(text));
            },
            child: Text(text),
          ),
        );
      },
    );
  }
}