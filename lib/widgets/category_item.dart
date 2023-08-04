import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../screens/setting_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kColorAppBAr,
                kColorAppBAr.withOpacity(0.45),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(20),
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            child: Image(
              image: AssetImage(url),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: isDarkMode.value ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
