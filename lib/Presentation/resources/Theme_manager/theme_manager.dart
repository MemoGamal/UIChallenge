import 'package:flutter/material.dart';
import 'package:ui_challenge/Presentation/constants/constants.dart';

import '../Text_Manager/text_style_manager.dart';
import '../font_Manager/font_manager.dart';

ThemeData GetApplicationTheme() {
  return ThemeData(
    // Text Theme :

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: Colours.headTextColour, fontsize: FontSize.s16),
      headlineLarge: getSemiBoldStyle(
          color: Colours.headTextColour, fontsize: FontSize.s16),
      headlineMedium: getRegularStyle(
          color: Colours.headTextColour, fontsize: FontSize.s14),
      // titleMedium:
      //     getMediumStyle(color: ColorManager.primary, fontsize: FontSize.s16),
      titleSmall:
          getRegularStyle(color: Colours.dotsColour, fontsize: FontSize.s16),
      bodyLarge: getRegularStyle(color: Colours.headTextColour),
      bodySmall: getRegularStyle(color: Colours.dotsColour),
      // bodyMedium:
      //     getRegularStyle(color: ColorManager.grey2, fontsize: FontSize.s12),
      labelSmall:
          getBoldStyle(color: Colours.headTextColour, fontsize: FontSize.s12),
    ),
  );
}
