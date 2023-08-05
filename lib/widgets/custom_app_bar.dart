import 'package:codelandia_news/data/news_list_item.dart';
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
bool isSearchActive = false;
bool isTextFieldShow = false;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        height: 210,
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
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        "News",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                          isTextFieldShow = !isTextFieldShow;
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: const TextFieldWidget(),
              secondChild: const Text(''),
              crossFadeState: isTextFieldShow
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                milliseconds: 500,
              ),
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeOut,
            ),
            Expanded(
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  14,
                ),
              ),
            ),
            filled: true,
            hintText: 'Search News',
            prefixIcon: Icon(
              Icons.search,
              color: isTextFieldShow ? Colors.transparent : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
