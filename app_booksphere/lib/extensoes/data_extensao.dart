import 'package:intl/intl.dart';

extension ConversaoData on DateTime {
  String formatarDataPTBR() {
    return DateFormat.yMd("pt-br").format(this);
  }

  DateTime ajustarDataParaFimDoDia() => this.add(Duration(minutes: 1439));
}
