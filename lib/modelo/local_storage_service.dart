import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/modelo/Objects/autorizacao.dart';
import 'package:login/modelo/Objects/refeicao.dart';
import 'dart:convert';

class LocalStorageService {
  //Constantes que indicam a chave shared em que o dado será persistido

  static const String AUTORIZACAO = 'autorizacao';

  // Salvar a autorizacao
  static Future<void> salvarAutorizacao(Autorizacao auth) async {
    //instancia a classe sp
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //converte o objeto em string
    final String encodedData = json.encode(auth.toMap());
    //Persiste o dado
    await prefs.setString(AUTORIZACAO, encodedData);
  }

  // Apagar a autorizacao
  static Future<void> desgravarAutorizacao() async {
    //instancia a classe sp
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(AUTORIZACAO);
  }

  // Recuperar a autorizacao
  static Future<Autorizacao?> carregarAutorizacao() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? authJson = prefs.getString(AUTORIZACAO);
    if (authJson == null) return null;
    //RETORNA A AUTORIZACAO
    return Autorizacao.fromMap(json.decode(authJson));
  }


  static const String LISTA_REFEICOES = 'lista_refeicoes';

// Salvar a lista de refeições
  static Future<void> salvarRefeicoes(List<Refeicao> refeicoes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = Refeicao.encode(refeicoes);
    await prefs.setString(LISTA_REFEICOES, encodedData);
  }

// Recuperar a lista de refeições
  static Future<List<Refeicao>> carregarRefeicoes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? refeicoesJson = prefs.getString(LISTA_REFEICOES);
    if (refeicoesJson == null) return [];
    return Refeicao.decode(refeicoesJson);
  }
}