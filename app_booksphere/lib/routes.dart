import 'package:bloc_demo/screens/homepage.dart';
import 'package:bloc_demo/screens/login/login.dart';
import 'package:flutter/widgets.dart';

const String RotaHome = "/home";
const String RotaLogin = "/login";
//const String RotaConsultaCorrespondenciaInterna = "/consultaCorrespondenciaInterna";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RotaLogin:
      return _getPageRoute(LoginContainer(), settings);
    case RotaHome:
      return _getPageRoute(HomePageContainer(), settings);
    /* case RotaConsultaCorrespondenciaInterna:
      final arguments = (settings.arguments as Map);
      return _getPageRoute(
          ConsultaCorrespondenciaInternaContainer(
            id: arguments['id'],
            categoriaBusca: arguments['categoriaBusca'],
            tipoDeCorrespondencia: arguments['tipoDeCorrespondencia'],
          ),
          settings);
 */
    default:
      return _getPageRoute(Container(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
