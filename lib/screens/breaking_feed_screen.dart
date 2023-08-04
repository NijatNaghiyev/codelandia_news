import 'package:codelandia_news/models/news_model.dart';
import 'package:codelandia_news/widgets/card_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class BreakingFeedScreen extends StatefulWidget {
  const BreakingFeedScreen({
    super.key,
    required this.filteredList,
    required this.bookmarkToList,
  });

  final List<NewsModel> filteredList;
  final void Function(NewsModel item) bookmarkToList;

  @override
  State<BreakingFeedScreen> createState() => _BreakingFeedScreenState();
}

class _BreakingFeedScreenState extends State<BreakingFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
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
        ),
      ],
    );
  }
}
