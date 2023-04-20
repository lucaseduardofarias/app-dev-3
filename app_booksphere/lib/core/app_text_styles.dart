import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const textStyleAppBarTitle = TextStyle(
    fontSize: 18,
    color: AppColors.gray,
    fontWeight: FontWeight.normal,
  );

  static const textStyleCinza14 = TextStyle(
    fontSize: 14,
    color: AppColors.textGrayColor,
  );

  static const textStyleTitleBold = TextStyle(
    fontSize: 21,
    color: AppColors.darkGray,
    fontWeight: FontWeight.bold,
  );

  static const textStyleTitle = TextStyle(
    fontSize: 21,
    color: AppColors.darkGray,
  );

  static const textStyleExpansionTileTitulo = TextStyle(
    fontSize: 14,
    color: AppColors.textGrayColor,
  );

  static const textStyleExpansionTileDetalheTitulo = TextStyle(
    fontSize: 12,
    color: AppColors.textGrayColor,
  );

  static const textStyleExpansionTileDetalheValor = TextStyle(
    fontSize: 14,
    color: AppColors.textDarkGrayColor,
  );

  static textStyleButtonDialogGray({bool isSmall = false}) => TextStyle(
        fontSize: isSmall ? 14 : 16,
        color: AppColors.darkGray,
        fontWeight: FontWeight.normal,
      );

  static const textStyleDialogMessage = TextStyle(
    fontSize: 16,
    color: AppColors.darkGray,
    fontWeight: FontWeight.normal,
  );

  static textStyleButtonDialogWhite({bool isSmall = false}) => TextStyle(
        fontSize: isSmall ? 14 : 16,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );

  static final elevatedButtonDialogBlueStyle = ElevatedButton.styleFrom(
    elevation: 0,
    primary: AppColors.blue,
    onPrimary: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static final elevatedButtonDialogWhiteStyle = ElevatedButton.styleFrom(
    elevation: 0,
    primary: Colors.white,
    onPrimary: Colors.black,
    side: BorderSide(width: 1.0, color: AppColors.darkGray),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static const textStyleHint = TextStyle(
    fontSize: 18,
    color: AppColors.lightGray,
  );
}
