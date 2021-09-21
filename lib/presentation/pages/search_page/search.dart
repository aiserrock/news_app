import 'package:flutter/material.dart';
import 'package:news_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:news_app/presentation/general_widgets/input_search_widget.dart';
import 'package:news_app/styles/styles.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {



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
            child: Text('About 11,130,000 results for BitCoin'),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _NewsList(),
          ),
        ],
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('List with news'),
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
        onPressed: () => print(text.toLowerCase()),
        child: Text(text),
      ),
    );
  }
}
