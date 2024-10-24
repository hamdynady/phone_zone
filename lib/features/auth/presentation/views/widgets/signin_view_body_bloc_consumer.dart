import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_zone/core/helper_functions/build_error_bar.dart';
import 'package:phone_zone/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:phone_zone/features/home/presentation/views/home_view.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }

        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
