import 'dart:async';

import 'package:codelandia_news/screens/news_category_screen.dart';
import 'package:codelandia_news/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import '../data/app_categories_list.dart';
import '../data/news_list_item.dart';
import '../models/news_model.dart';
import '../widgets/category_item.dart';
import 'main_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      required this.filteredList,
      required this.bookmarkToList,
      required this.filterList});

  final List<NewsModel> filteredList;
  final void Function(NewsModel item) bookmarkToList;
  final void Function() filterList;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: isDarkMode.value ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: List.generate(
                categories.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      typeOfNews = typeList[index];
                      Timer(
                        const Duration(milliseconds: 100),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsCategoryScreen(
                                title: categories[index].title,
                                filteredList: widget.filteredList,
                                bookmarkToList: widget.bookmarkToList,
                                filterList: widget.filterList,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                      );
                    },
                    child: CategoryItem(
                      title: categories[index].title,
                      url: categories[index].url,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
