import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhavi_app/core/core.dart';
import 'package:medhavi_app/src/onboarding/presentation/login/bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 32.v),
                    sliver: const SliverToBoxAdapter(
                        child: SafeArea(child: Center(child: AppLogo()))),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 8.v),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'log_in'.tr(),
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: 10.v.verticalSpace),
                  SliverToBoxAdapter(
                    child: CustomTextFormField(
                      label: 'email',
                      isRequired: true,
                      onChanged: (value) {},
                      hinText: 'email'.tr(),
                    ),
                  ),
                  SliverToBoxAdapter(child: 8.v.verticalSpace),
                  SliverToBoxAdapter(
                    child: CustomTextFormField(
                      label: 'password',
                      onChanged: (value) => context
                          .read<LoginBloc>()
                          .add(OnPasswordChangedEvent(value)),
                      isObscure: !state.showPassword,
                      hinText: 'password'.tr(),
                      suffixIcon: TapBouncerWidget(
                        onPressedEvent: () => context
                            .read<LoginBloc>()
                            .add(OnShowPasswordEvent(!state.showPassword)),
                        child: SvgViewer.fromAsset(
                          path: !state.showPassword
                              ? AssetList.hidePassIcon
                              : AssetList.showPassIcon,
                          colorFilter: ColorFilter.mode(
                            context.theme.primaryA!,
                            BlendMode.srcIn,
                          ),
                          size: 18.adaptSize,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            'forgot_password'.tr(),
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: context.theme.accent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: 8.v.verticalSpace),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      label: 'login',
                      onTap: () {},
                    ),
                  ),
                  SliverToBoxAdapter(child: 14.v.verticalSpace),
                  SliverToBoxAdapter(
                    child: CustomButton.outlined(
                      label: 'sign_up_with_email',
                      onTap: () {},
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomDivider.label(),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton.outlined(
                      label: Platform.isAndroid
                          ? 'continue_with_google'
                          : 'continue_with_apple',
                      iconPath: Platform.isAndroid
                          ? AssetList.googleIcon
                          : AssetList.appleIcon,
                      onTap: () {},
                    ),
                  ),
                  SliverToBoxAdapter(child: 20.v.verticalSpace)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
