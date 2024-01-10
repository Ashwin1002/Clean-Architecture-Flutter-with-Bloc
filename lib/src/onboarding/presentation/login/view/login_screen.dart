import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/extensions/context_extension.dart';
import 'package:medhavi_app/core/utils/extensions/num_extension.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/app_logo.dart';
import 'package:medhavi_app/core/widgets/forms/text_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'login'.tr(),
                    style: context.textTheme.headlineMedium,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: 10.v.verticalSpace),
              SliverToBoxAdapter(
                child: CustomTextFormField(
                  label: 'email'.tr(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
