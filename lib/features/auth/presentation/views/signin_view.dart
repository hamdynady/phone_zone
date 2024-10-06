import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_zone/core/services/get_it_service.dart';
import 'package:phone_zone/features/auth/domain/repos/auth_repo.dart';
import 'package:phone_zone/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('تسجيل دخول'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
