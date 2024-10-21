import 'package:flutter/material.dart';
import 'package:phone_zone/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:phone_zone/features/home/presentation/views/widgets/search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(child: CustomHomeAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 23)),
          SliverToBoxAdapter(child: HomeSearchBar()),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
        ],
      ),
    );
  }
}
