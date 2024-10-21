import 'package:flutter/material.dart';
import 'package:phone_zone/core/utils/app_images.dart';
import 'package:phone_zone/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined),
      ),
      title: Text(
        'الرئيسية',
        style: TextStyles.regular16.copyWith(color: const Color(0xff733168)),
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Stack(
          children: [
            SvgPicture.asset(Assets.imageBag),
            SvgPicture.asset(Assets.imageBag2),
          ],
        ),
      ),
    );
  }
}
