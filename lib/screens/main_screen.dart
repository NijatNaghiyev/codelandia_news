import 'dart:async';

import 'package:codelandia_news/screens/bookmarks_screen.dart';
import 'package:codelandia_news/screens/breaking_feed_screen.dart';
import 'package:codelandia_news/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/color.dart';
import '../data/news_list_item.dart';
import '../main.dart';
import '../models/news_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int indexScreen = 0;
String typeOfNews = 'FOR YOU';
List<NewsModel> bookmarkedList = [];

class _MainScreenState extends State<MainScreen> {
  List<NewsModel> filteredList = NewsListItem.item;
  void filterList() {
    Timer(Duration.zero, () {
      setState(() {});
    });
    if (typeOfNews == 'FOR YOU') {
      filteredList = NewsListItem.item;
    } else {
      filteredList = NewsListItem.item
          .where((element) => element.title == typeOfNews)
          .toList();
    }
  }

  void bookmarkToList(NewsModel item) {
    if (bookmarkedList.contains(item)) {
      bookmarkedList.remove(item);
    } else {
      bookmarkedList.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    themeMode.addListener(() {
      setState(() {});
    });

    filterList();
    Widget activeScreen = BreakingFeedScreen(
      bookmarkToList: bookmarkToList,
      filteredList: filteredList,
    );
    if (indexScreen == 3) {
      activeScreen = const SettingScreen();
    } else if (indexScreen == 2) {
      activeScreen = BookMarksScreen(
        bookmarkToList: bookmarkToList,
        bookmarkedList: bookmarkedList,
      );
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: buildGNav(),
    );
  }

  GNav buildGNav() {
    return GNav(
      textSize: 12,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorBottomBarIcon,
      ),
      activeColor: kColorBottomBarIcon,
      color: Colors.grey,
      onTabChange: (value) {
        setState(() {});
        indexScreen = value;
      },
      tabs: [
        const GButton(
          icon: Icons.newspaper,
          text: 'Breaking',
        ),
        const GButton(
          icon: Icons.file_copy,
          text: 'Categories',
        ),
        GButton(
          icon: indexScreen == 2 ? Icons.bookmark : Icons.bookmark_border,
          text: 'Bookmarks',
        ),
        const GButton(
          icon: Icons.settings,
          text: 'Settings',
        ),
      ],
    );
  }
}
