import 'package:flutter/material.dart';
import 'package:phone_zone/features/home/presentation/views/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
