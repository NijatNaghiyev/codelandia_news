import 'package:codelandia_news/data/news_list_item.dart';
import 'package:codelandia_news/screens/breaking_feed_screen.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../screens/main_screen.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

int indexTypeNews = 0;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        height: 158,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kColorAppBAr,
              kColorAppBAr.withOpacity(0.45),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                textAlign: TextAlign.center,
                "News",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              trailing: IconButton(
                onPressed: () {
                  print(typeOfNews);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: typeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {});
                          indexTypeNews = index;
                          typeOfNews = typeList[index];
                        },
                        child: Text(
                          typeList[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 3,
                        width: 70,
                        color: indexTypeNews == index
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}