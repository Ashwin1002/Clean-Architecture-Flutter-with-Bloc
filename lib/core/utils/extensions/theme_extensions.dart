import 'package:flutter/material.dart';
import 'package:medhavi_app/core/constants/colors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  ///Foundation
  final Color? primaryA;
  final Color? primaryB;

  final Color? accent;
  final Color? warning;

  final Color? positive;
  final Color? negative;

  ///Background
  final Color? backgroundPrimary;
  final Color? backgroundInverserPrimary;

  final Color? backgroundSecondary;
  final Color? backgroundInverserSecondary;

  final Color? backgroundTeritiary;
  final Color? backgroundAccent;

  ///Content
  final Color? contentPrimary;
  final Color? contentInversePrimary;

  final Color? contentSecondary;
  final Color? contentInverseSecondary;

  final Color? contentTeritiary;
  final Color? contentInverseTeritiary;

  ///border
  final Color? borderOpaque;
  final Color? borderInverseOpaque;

  final Color? borderSelected;
  final Color? borderInverseSelected;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;

  const CustomThemeExtension({
    this.primaryA,
    this.primaryB,
    this.accent,
    this.warning,
    this.positive,
    this.negative,
    this.backgroundPrimary,
    this.backgroundInverserPrimary,
    this.backgroundSecondary,
    this.backgroundInverserSecondary,
    this.backgroundTeritiary,
    this.backgroundAccent,
    this.contentPrimary,
    this.contentInversePrimary,
    this.contentSecondary,
    this.contentInverseSecondary,
    this.contentTeritiary,
    this.contentInverseTeritiary,
    this.borderOpaque,
    this.borderInverseOpaque,
    this.borderSelected,
    this.borderInverseSelected,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
  });

  static const lightMode = CustomThemeExtension(
    primaryA: AppColors.primaryLightA,
    primaryB: AppColors.primaryLightB,
    accent: AppColors.accentLight,
    warning: AppColors.warningLight,
    positive: AppColors.positiveLight,
    negative: AppColors.negativeLight,
    backgroundPrimary: AppColors.backgroundPrimaryLight,
    backgroundInverserPrimary: AppColors.backgroundInverserPrimaryLight,
    backgroundSecondary: AppColors.backgroundSecondaryLight,
    backgroundInverserSecondary: AppColors.backgroundInverserSecondaryLight,
    backgroundTeritiary: AppColors.backgroundTeritiaryLight,
    backgroundAccent: AppColors.backgroundAccentLight,
    contentPrimary: AppColors.contentPrimaryLight,
    contentInversePrimary: AppColors.contentInversePrimaryLight,
    contentSecondary: AppColors.contentSecondaryLight,
    contentInverseSecondary: AppColors.contentInverseSecondaryLight,
    contentTeritiary: AppColors.contentTeritiaryLight,
    contentInverseTeritiary: AppColors.contentInverseTeritiaryLight,
    borderOpaque: AppColors.borderOpaqueLight,
    borderInverseOpaque: AppColors.borderInverseOpaqueLight,
    borderSelected: AppColors.borderSelectedLight,
    borderInverseSelected: AppColors.borderInverseSelectedLight,
    shimmerBaseColor: Color(0xFFE0E0E0),
    shimmerHighlightColor: Color(0xFFEEEEEE),
  );

  static const darkMode = CustomThemeExtension(
    primaryA: AppColors.primaryDarkA,
    primaryB: AppColors.primaryDarkB,
    accent: AppColors.accentDark,
    warning: AppColors.warningDark,
    positive: AppColors.positiveDark,
    negative: AppColors.negativeDark,
    backgroundPrimary: AppColors.backgroundPrimaryDark,
    backgroundInverserPrimary: AppColors.backgroundInverserPrimaryDark,
    backgroundSecondary: AppColors.backgroundSecondaryDark,
    backgroundInverserSecondary: AppColors.backgroundInverserSecondaryDark,
    backgroundTeritiary: AppColors.backgroundTeritiaryDark,
    backgroundAccent: AppColors.backgroundAccentDark,
    contentPrimary: AppColors.contentPrimaryDark,
    contentInversePrimary: AppColors.contentInversePrimaryDark,
    contentSecondary: AppColors.contentSecondaryDark,
    contentInverseSecondary: AppColors.contentInverseSecondaryDark,
    contentTeritiary: AppColors.contentTeritiaryDark,
    contentInverseTeritiary: AppColors.contentInverseTeritiaryDark,
    borderOpaque: AppColors.borderOpaqueDark,
    borderInverseOpaque: AppColors.borderInverseOpaqueDark,
    borderSelected: AppColors.borderSelectedDark,
    borderInverseSelected: AppColors.borderInverseSelectedDark,
    shimmerBaseColor: Color(0xFF616161),
    shimmerHighlightColor: Color(0xFF9E9E9E),
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    ///Foundation
    Color? primaryA,
    Color? primaryB,
    Color? accent,
    Color? warning,
    Color? positive,
    Color? negative,

    ///Background
    Color? backgroundPrimary,
    Color? backgroundInverserPrimary,
    Color? backgroundSecondary,
    Color? backgroundInverserSecondary,
    Color? backgroundTeritiary,
    Color? backgroundAccent,

    ///Content
    Color? contentPrimary,
    Color? contentInversePrimary,
    Color? contentSecondary,
    Color? contentInverseSecondary,
    Color? contentTeritiary,
    Color? contentInverseTeritiary,

    ///border
    Color? borderOpaque,
    Color? borderInverseOpaque,
    Color? borderSelected,
    Color? borderInverseSelected,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
  }) {
    return CustomThemeExtension(
      primaryA: primaryA ?? this.primaryA,
      primaryB: primaryB ?? this.primaryB,
      accent: accent ?? this.accent,
      warning: warning ?? this.warning,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundInverserPrimary:
          backgroundInverserPrimary ?? this.backgroundInverserPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundInverserSecondary:
          backgroundInverserSecondary ?? this.backgroundInverserSecondary,
      backgroundTeritiary: backgroundTeritiary ?? this.backgroundTeritiary,
      backgroundAccent: backgroundAccent ?? this.backgroundAccent,
      contentPrimary: contentPrimary ?? this.contentPrimary,
      contentInversePrimary:
          contentInversePrimary ?? this.contentInversePrimary,
      contentSecondary: contentSecondary ?? this.contentSecondary,
      contentInverseSecondary:
          contentInverseSecondary ?? this.contentInverseSecondary,
      contentTeritiary: contentTeritiary ?? this.contentTeritiary,
      contentInverseTeritiary:
          contentInverseSecondary ?? this.contentInverseSecondary,
      borderOpaque: borderOpaque ?? this.borderOpaque,
      borderInverseOpaque: borderInverseOpaque ?? this.borderInverseOpaque,
      borderSelected: borderSelected ?? this.borderSelected,
      borderInverseSelected:
          borderInverseSelected ?? this.borderInverseSelected,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      ///
      primaryA: Color.lerp(primaryA, other.primaryA, t),
      primaryB: Color.lerp(primaryB, primaryB, t),
      accent: Color.lerp(accent, other.accent, t),
      warning: Color.lerp(warning, other.warning, t),
      positive: Color.lerp(positive, other.positive, t),
      negative: Color.lerp(negative, other.negative, t),

      ///
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t),
      backgroundInverserPrimary: Color.lerp(
          backgroundInverserPrimary, other.backgroundInverserPrimary, t),
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t),
      backgroundInverserSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t),
      backgroundTeritiary:
          Color.lerp(backgroundTeritiary, other.backgroundTeritiary, t),
      backgroundAccent: Color.lerp(backgroundAccent, other.backgroundAccent, t),

      ///
      contentPrimary: Color.lerp(contentPrimary, other.contentPrimary, t),
      contentInversePrimary:
          Color.lerp(contentInversePrimary, other.contentInversePrimary, t),
      contentSecondary: Color.lerp(contentSecondary, other.contentSecondary, t),
      contentInverseSecondary:
          Color.lerp(contentInverseSecondary, other.contentInverseSecondary, t),
      contentTeritiary: Color.lerp(contentTeritiary, other.contentTeritiary, t),
      contentInverseTeritiary:
          Color.lerp(contentInverseTeritiary, other.contentInverseTeritiary, t),

      ///
      borderOpaque: Color.lerp(borderOpaque, other.borderOpaque, t),
      borderInverseOpaque:
          Color.lerp(borderInverseOpaque, other.borderInverseOpaque, t),
      borderInverseSelected:
          Color.lerp(borderInverseSelected, other.borderInverseSelected, t),
      borderSelected: Color.lerp(borderSelected, other.borderSelected, t),

      ///
      shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t),
      shimmerHighlightColor:
          Color.lerp(shimmerHighlightColor, other.shimmerHighlightColor, t),
    );
  }
}
