import 'package:bloc_demo/core/app_assets.dart';
import 'package:bloc_demo/util/componente_util.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ScaffoldBaseBody extends StatelessWidget {
  final bool carregando;
  final dynamic tela;
  final bool mostrarPlanoFundo;
  final Color corPlanoFundo;
  final AppBar? appBar;
  final BuildContext contexto;

  const ScaffoldBaseBody({
    Key? key,
    required this.carregando,
    required this.tela,
    required this.contexto,
    this.corPlanoFundo = Colors.transparent,
    this.mostrarPlanoFundo = false,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: double.infinity,
        decoration: mostrarPlanoFundo
            ? BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AppAssets.getImage(AppAssets.planoFundo),
                  alignment: Alignment.bottomCenter,
                ),
              )
            : BoxDecoration(color: corPlanoFundo),
        child: ModalProgressHUD(
          inAsyncCall: carregando,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight:
                      ComponenteUtil.obterAlturaTela(contexto, appBar: appBar)),
              child: IntrinsicHeight(child: tela),
            ),
          ),
        ),
      ),
    );
  }
}
