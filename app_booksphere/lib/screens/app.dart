import 'package:bloc_demo/model/token.dart';
import 'package:bloc_demo/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes.dart';
import '../config.dart';
import 'login/login.dart';

class App extends StatelessWidget {
  final Token token;
  App(this.token);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      onGenerateRoute: generateRoute,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.tituloApp,
      theme: themeData,
      home: getScreen(),
    );
  }

  getScreen() {
    print('token = ${token.accessToken}');
    if (token.accessToken == null) {
      return LoginContainer();
    } else {
      return HomePageContainer();
    }
  }
}
