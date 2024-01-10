import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhavi_app/core/constants/images.dart';
import 'package:medhavi_app/core/router/app_router.gr.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/svg_viewer.dart';
import 'package:medhavi_app/src/onboarding/presentation/splash/cubit/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..splashCompleter(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.splashStatus.isSuccess) {
            context.router.push(const LoginRoute());
          }
        },
        child: Scaffold(
          body: Center(
            child: SvgViewer.fromAsset(
              path: AssetList.appLogoNoBG,
              height: 80.v,
              width: 222.h,
            ),
          ),
        ),
      ),
    );
  }
}
