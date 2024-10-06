import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(context,
    {required String title, bool automaticallyImplyLeading = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
