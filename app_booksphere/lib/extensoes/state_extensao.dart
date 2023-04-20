import 'package:bloc_demo/components/dialogo_alerta.dart';
import 'package:bloc_demo/core/app_assets.dart';
import 'package:bloc_demo/rede/http_exception.dart';
import 'package:bloc_demo/rede/unauthorized_exception.dart';
import 'package:bloc_demo/routes.dart';
import 'package:bloc_demo/util/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ErrorExtension on State {
  void mostrarDialogoErro({
    required Exception exception,
    required VoidCallback reload,
    bool isConfirmDialog = false,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (exception is UnauthorizedException) {
          await logout();
        } else {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (contextDialog) {
              return DialogoAlerta(
                titulo: "",
                mensagem: obterMensagemErro(exception),
                nomeBotao: reload == null
                    ? 'AppLocalizations.of(context).dialogoBotaoOk'
                    : 'AppLocalizations.of(context).dialogoBotaoTentarNovamente',
                //iconeSvg: AppAssets.getSvgImage(AppAssets.iconeErro),
                ehDialogoConfirmar: isConfirmDialog,
                aoConfirmar: reload,
              );
            },
          );
        }
      },
    );
  }

  void mostrarDialogo({
    required VoidCallback reload,
    bool isConfirmDialog = false,
    required String mensagem,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (contextDialog) {
            return DialogoAlerta(
              titulo: "",
              mensagem: mensagem,
              nomeBotao: reload == null
                  ? 'AppLocalizations.of(context).dialogoBotaoOk'
                  : 'AppLocalizations.of(context).dialogoBotaoTentarNovamente',
              ehDialogoConfirmar: isConfirmDialog,
              aoConfirmar: reload,
            );
          },
        );
      },
    );
  }

  String obterMensagemErro(Exception exception) {
    String errorMessage;
    if (exception is HttpException) {
      HttpException e = exception;
      errorMessage = e.mensagem;
    } else {
      errorMessage = 'AppLocalizations.of(context).mensagemErroGeral';
    }
    return errorMessage;
  }
}

extension LogoutExtension on State {
  Future<void> logout() async {
    SharedPreferencesUtil.limpar();
    Navigator.pushNamedAndRemoveUntil(context, RotaLogin, (route) => false);
  }
}
