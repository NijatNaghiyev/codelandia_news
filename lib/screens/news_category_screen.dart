import 'package:codelandia_news/constants/color.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../widgets/card_widgets.dart';

class NewsCategoryScreen extends StatefulWidget {
  const NewsCategoryScreen({
    super.key,
    required this.title,
    required this.filteredList,
    required this.bookmarkToList,
    required this.filterList,
  });

  final String title;
  final List<NewsModel> filteredList;
  final void Function(NewsModel item) bookmarkToList;
  final void Function() filterList;

  @override
  State<NewsCategoryScreen> createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    widget.filterList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: kColorAppBAr,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height -
            MediaQuery.of(context).padding.top,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.filteredList.length,
          itemBuilder: (context, index) => CardWidget(
            item: widget.filteredList[index],
            bookmarkToList: widget.bookmarkToList,
            title: widget.filteredList[index].title,
            desc: widget.filteredList[index].desc,
            info: widget.filteredList[index].info,
            images: widget.filteredList[index].image,
          ),
        ),
      ),
    );
  }
}
