import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get tituloApp => 'Booksphere';

  @override
  String get appBarLabel => 'Booksphere';

  @override
  String get dialogoConfirmacaoBotaoCancelar => 'Cancelar';

  @override
  String get dialogoConfirmacaoBotaoConfirmar => 'Confirmar';

  @override
  String get dialogoBotaoTentarNovamente => 'Tentar novamente';

  @override
  String get dialogoBotaoOk => 'OK';

  @override
  String get mensagemErroUsuarioVazio => 'Digite um e-mail';

  @override
  String get mensagemErroSenhaVazia => 'Digite uma senha';

  @override
  String get mensagemNaoAutorizado => 'Não autorizado';

  @override
  String get mensagemErroGeral => 'Ocorreu um erro';
}
