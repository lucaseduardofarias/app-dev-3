import 'package:flutter/material.dart';

abstract class ComponenteUtil {
  static double obterAlturaTela(BuildContext contexto, {AppBar? appBar}) {
    double altura = MediaQuery.of(contexto).size.height;
    double alturaAppBar = appBar == null ? 0 : appBar.preferredSize.height;
    double safePadding = MediaQuery.of(contexto).padding.top +
        MediaQuery.of(contexto).padding.bottom;
    double tamanhoTeclado = MediaQuery.of(contexto).viewInsets.bottom;
    double total = altura - alturaAppBar - safePadding - tamanhoTeclado;
    return total > 0 ? total : 0;
  }

  static Future mostrarDialog(context,
      {required StatefulWidget dialogo, bool fecharCliqueFora = false}) {
    return showDialog(
        barrierDismissible: fecharCliqueFora,
        context: context,
        builder: (contextDialog) => dialogo);
  }

  static OutlineInputBorder borda(Color color, {double width = 1.0}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
      );
}
