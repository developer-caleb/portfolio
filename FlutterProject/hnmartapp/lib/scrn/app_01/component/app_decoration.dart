import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class AppDecoration {
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: AppColors.whiteA700,
      );
}

class BorderRadiusStyle {}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
