import 'package:flutter/material.dart';

abstract class AppAssets {
  static const _imagePathBase = "assets/images/";

  static const logoGer5 = "logo_ger5.png";
  static const planoFundo = "plano_fundo.png";

  static AssetImage getImage(String asset) =>
      AssetImage(getImageAssetPath(asset));

  static getImageAssetPath(String asset) => "$_imagePathBase$asset";
}
