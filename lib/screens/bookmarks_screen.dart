import 'package:codelandia_news/constants/color.dart';
import 'package:codelandia_news/screens/main_screen.dart';
import 'package:codelandia_news/screens/setting_screen.dart';
import 'package:codelandia_news/widgets/card_widgets.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({
    super.key,
    required this.bookmarkedList,
    required this.bookmarkToList,
  });

  final List<NewsModel> bookmarkedList;
  final void Function(NewsModel item) bookmarkToList;

  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}

class _BookMarksScreenState extends State<BookMarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorAppBAr,
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: bookmarkedList.isEmpty
          ? Center(
              child: Text(
                'Oops ... There is nothing!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: isDarkMode.value ? Colors.white : Colors.black,
                    ),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.bookmarkedList.length,
              itemBuilder: (context, index) => CardWidget(
                item: widget.bookmarkedList[index],
                bookmarkToList: widget.bookmarkToList,
                title: widget.bookmarkedList[index].title,
                desc: widget.bookmarkedList[index].desc,
                info: widget.bookmarkedList[index].info,
                images: widget.bookmarkedList[index].image,
              ),
            ),
    );
  }
}
