import 'package:intl/intl.dart';

abstract class DataUtil {
  static dataParaString(final DateTime dateTime, final String format) =>
      DateFormat(format).format(dateTime);

  static utcParaLocal(String dataString) =>
      DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dataString, true).toLocal();

  static dataCompletaComHora(final DateTime dateTime) =>
      "${dataParaString(dateTime, "yMMMMEEEEd")} às ${dataParaString(dateTime, "HH:mm")}";

  static dataComHora(final DateTime dateTime) =>
      "${dataParaString(dateTime, "dd/MM/yyyy")} às ${dataParaString(dateTime, "HH:mm")}";
}
