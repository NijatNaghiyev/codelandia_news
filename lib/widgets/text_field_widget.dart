import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
