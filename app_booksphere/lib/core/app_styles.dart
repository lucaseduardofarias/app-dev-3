import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static final elevatedButton = ElevatedButton.styleFrom(
    elevation: 0,
    primary: AppColors.blue,
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static final elevatedButtonRed = ElevatedButton.styleFrom(
    elevation: 0,
    primary: AppColors.red,
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static final elevatedButtonWhite = ElevatedButton.styleFrom(
    elevation: 0,
    primary: Colors.white,
    onPrimary: AppColors.blue,
    side: BorderSide(width: 1.0, color: AppColors.blue),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static final elevatedButtonInactive = ElevatedButton.styleFrom(
    elevation: 0,
    primary: AppColors.blue.withOpacity(0.5),
    onPrimary: Colors.white,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
