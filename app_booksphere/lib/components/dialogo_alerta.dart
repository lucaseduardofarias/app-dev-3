import 'package:bloc_demo/core/app_styles.dart';
import 'package:bloc_demo/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogoAlerta extends StatefulWidget {
  final VoidCallback aoConfirmar;
  final String mensagem;
  final String titulo;
  final Icon? icone;
  final String? nomeBotao;
  final bool ehDialogoConfirmar;

  DialogoAlerta({
    required this.mensagem,
    required this.titulo,
    this.nomeBotao,
    this.ehDialogoConfirmar = false,
    required this.aoConfirmar,
    this.icone,
  });

  @override
  _DialogoAlertaState createState() => _DialogoAlertaState();
}

class _DialogoAlertaState extends State<DialogoAlerta> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  if (widget.titulo != null) _construirTitulo(),
                  _construirMensagem(),
                  _construirLinhaBotoes(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _construirTitulo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        widget.titulo,
        textAlign: TextAlign.center,
        style: AppTextStyles.textStyleTitleBold,
      ),
    );
  }

  Padding _construirMensagem() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
      child: Center(
        child: Text(
          widget.mensagem,
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyleDialogMessage,
        ),
      ),
    );
  }

  Widget _construirLinhaBotoes() => widget.ehDialogoConfirmar
      ? _construirBotoes()
      : _construirBotaoConfirmar();

  Padding _construirBotoes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runSpacing: 5,
          children: [
            _construirBotaoCancelar(),
            _construirBotaoConfirmar(),
          ],
        ),
      ),
    );
  }

  ConstrainedBox _construirBotaoConfirmar() {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minWidth: 133,
      ),
      child: ElevatedButton(
        style: AppStyles.elevatedButton,
        onPressed: () {
          if (widget.aoConfirmar != null) {
            widget.aoConfirmar();
          }
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Text(
            widget.nomeBotao ??
                AppLocalizations.of(context)!.dialogoConfirmacaoBotaoConfirmar,
            style: AppTextStyles.textStyleButtonDialogWhite(
                isSmall: _ehTelaPequena()),
          ),
        ),
      ),
    );
  }

  ConstrainedBox _construirBotaoCancelar() {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minWidth: 133,
      ),
      child: ElevatedButton(
        style: AppStyles.elevatedButtonWhite,
        onPressed: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Text(
            AppLocalizations.of(context)!.dialogoConfirmacaoBotaoCancelar,
            style: AppTextStyles.textStyleButtonDialogGray(
                isSmall: _ehTelaPequena()),
          ),
        ),
      ),
    );
  }

  bool _ehTelaPequena() =>
      MediaQuery.of(context).devicePixelRatio *
          MediaQuery.of(context).size.width <
      800;
}
