import 'dart:async';

import 'package:codelandia_news/screens/bookmarks_screen.dart';
import 'package:codelandia_news/screens/breaking_feed_screen.dart';
import 'package:codelandia_news/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../data/news_list_item.dart';
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 20,
      currentIndex: indexScreen,
      backgroundColor: Colors.white70,
      selectedFontSize: 12,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onTap: (value) {
        setState(() {});
        indexScreen = value;
      },
      showUnselectedLabels: true,
      selectedItemColor: kColorSian,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'Breaking Feed'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border), label: 'Bookmarks'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
