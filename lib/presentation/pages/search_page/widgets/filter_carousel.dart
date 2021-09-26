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
          _FilterChipElement(bloc: bloc),
          ...Constants.SEARCH_THEME
              .map((e) => _ChipElement(text: e, bloc: bloc)),
        ],
      ),
    );
  }
}

class _FilterChipElement extends StatelessWidget {
  const _FilterChipElement({Key? key, this.text = 'Filter', required this.bloc})
      : super(key: key);

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
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Color(0xFF737373),
                    height: 315,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(14),
                            topRight: const Radius.circular(14),
                          ),
                        ),
                        child: Column(
                          children: [],
                        )),
                  );
                },
              );
            },
            child: Row(
              children: [
                Icon(Icons.filter_alt_outlined, size: 16),
                SizedBox(width: 4),
                Text(text),
              ],
            ),
          ),
        );
      },
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
