import 'package:flutter/widgets.dart';

class HttpException implements Exception {
  final dynamic mensagem;
  final int codigo;

  HttpException({@required this.mensagem, required this.codigo});
}
