import 'dart:convert';
import 'package:bloc_demo/core/app_shared_prefs_keys.dart';
import 'package:bloc_demo/model/lista.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/token.dart';

abstract class SharedPreferencesUtil {
  static Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }

  static Future limpar() async {
    var sharedPreferences = await _getSharedPreferences();
    sharedPreferences.clear();
  }

  static Future<void> salvarLista(List<ListaLivros> lista) async {
    var sharedPreferences = await _getSharedPreferences();
    print('lista: $lista');
    print('salvarLista: ${json.encode(lista.map((e) => e.toJson()))}');
    return;
    await sharedPreferences.setString(
        AppSharedPrefsKeys.lista, json.encode(lista.map((e) => e.toJson())));
  }

  static Future<List<ListaLivros>> recuperarLista() async {
    var sharedPreferences = await _getSharedPreferences();
    var listaJson = sharedPreferences.getString(AppSharedPrefsKeys.lista);
    print('listaJson: $listaJson');
    return [];
    //return ListaLivros.fromJson(json.decode(listaJson!));
  }

  static Future<void> salvarToken(Token token) async {
    var sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(
        AppSharedPrefsKeys.token, json.encode(token.toJson()));
  }

  static Future<Token> recuperarToken() async {
    var sharedPreferences = await _getSharedPreferences();
    var tokenJson = sharedPreferences.getString(AppSharedPrefsKeys.token);
    if (tokenJson == null) return Token();
    return Token.fromJson(json.decode(tokenJson));
  }
}
