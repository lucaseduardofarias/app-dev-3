import 'package:bloc_demo/model/token.dart';
import 'package:bloc_demo/screens/app.dart';
import 'package:bloc_demo/util/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = "pt_BR";
  Token token = await SharedPreferencesUtil.recuperarToken();
  runApp(App(token));
}
