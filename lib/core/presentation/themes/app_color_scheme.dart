import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/themes/material_colors.dart';

abstract class AppColorScheme {
  Brightness get brightness;

  MaterialTextColor get textColor;

  Color get primaryColor => Colors.black;

  Color get secondaryColor => const Color(0xffFFC268);

  Color get whiteColor => const Color(0xffFFFFFF);

  Color get containerColor => const Color(0xff262626);

  Color get lightBlack => const Color(0xff171717);

  Color get grey => const Color(0xff999999);

  Color get brown => const Color(0xffC25F30);

  Color get lightGrey => const Color(0xffD9D9D9);

  Color get dividerColor => const Color(0xff262626);

  Color get errorColor => Colors.red;

  Color get successColor => Colors.green;
}

class AppDarkColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  MaterialTextColor get textColor => const MaterialTextColor(
        0xffFFFFFF,
        <TextColor, Color>{
          TextColor.black: Colors.black,
          TextColor.white: Colors.white,
          TextColor.yellow: Color(0xffFFC268),
          TextColor.lightGrey: Color(0xff999999),
        },
      );
}
