import 'package:bloc_demo/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

get localizationsDelegates {
  List<LocalizationsDelegate<dynamic>> localizationsDelegates = [];
  localizationsDelegates.addAll(AppLocalizations.localizationsDelegates);
  return localizationsDelegates;
}

get supportedLocales => AppLocalizations.supportedLocales;

get themeData => ThemeData(
      scaffoldBackgroundColor: AppColors.grayScaffoldBackground,
    );
