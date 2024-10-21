import 'package:flutter/material.dart';
import 'package:phone_zone/core/utils/app_images.dart';
import 'package:phone_zone/core/widgets/custom_text_field.dart';
import 'package:svg_flutter/svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: CustomTextFormField(
              hintText: 'بحث عن منتج',
              textInputType: TextInputType.emailAddress,
              suffixIcon: SvgPicture.asset(
                Assets.imageSearch,
                fit: BoxFit.scaleDown,
              ),
              radius: 28,
            ),
          ),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imageFilter),
        ),
      ],
    );
  }
}
