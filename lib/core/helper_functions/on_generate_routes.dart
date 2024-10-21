import 'package:flutter/material.dart';
import 'package:phone_zone/features/auth/presentation/views/signin_view.dart';
import 'package:phone_zone/features/auth/presentation/views/signup_view.dart';
import 'package:phone_zone/features/home/presentation/views/home_view.dart';
import 'package:phone_zone/features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
