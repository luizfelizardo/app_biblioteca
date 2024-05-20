import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const stringKey = 'stringkey';
const stringListKey = 'stringListKey';

class LocalDate {
  static salvarString(String valor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString(stringKey, valor);
    debugPrint("$valor salvo com sucesso");
  }

  static salvarListaString(List<String> lista) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    await shared.setStringList(stringListKey, lista);
    debugPrint(lista.toString());
  }

  static Future<String> getString() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    return shared.getString(stringKey) ?? "Vazio";
  }

  static Future<List<String>> getListString() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getStringList(stringListKey) ?? [];
  }
}
