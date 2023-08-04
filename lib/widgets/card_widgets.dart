import 'package:codelandia_news/constants/color.dart';
import 'package:codelandia_news/screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.info,
    required this.images,
    required this.bookmarkToList,
    required this.item,
  });
  final String title;
  final String desc;
  final String info;
  final String images;
  final void Function(NewsModel item) bookmarkToList;
  final NewsModel item;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: kColorSian,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Text(widget.desc,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(widget.images),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('US Times \t 3hr age',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: kColorSian,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                          widget.bookmarkToList(widget.item);
                        },
                        icon: Icon(
                          bookmarkedList.contains(widget.item)
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: kColorSian,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: kColorSian,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
