import 'package:dio/dio.dart';
import 'package:login/modelo/Objects/refeicao.dart';
import 'package:login/modelo/api/Sincroniza.dart';
import 'package:login/modelo/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RefeicaoController {

  // Guarda os dados do plano que vieram da API
  static Map<String, dynamic>? dadosPlano;

  static Future<List<Refeicao>> carregarRefeicoes() async {
    return await LocalStorageService.carregarRefeicoes();
  }

  static Future<void> salvarRefeicoes(List<Refeicao> refeicoes) async {
    await LocalStorageService.salvarRefeicoes(refeicoes);
  }

  static Future<bool> carregarPlanoDaApi(String token) async {
    try {
      Response response =
      await Sincroniza().requestClientePlano(token);

      if (response.statusCode == 200) {

        // Pega os dados do plano
        final plano = response.data['plano'];

        // Guarda os dados do plano
        dadosPlano = plano;

        // Pega as refeições
        List<dynamic> listaRefeicoes = plano['refeicoes'];

        final refeicoesSalvas =
        await LocalStorageService.carregarRefeicoes();

        List<Refeicao> refeicoes = listaRefeicoes.map((item) {
          final refeicaoSalva = refeicoesSalvas.firstWhere(
                (r) => r.id == item['id'],
            orElse: () => Refeicao(
              id: item['id'],
              nome: item['nome'],
              descricao: item['descricao'],
              horario: item['horario'].toString().substring(0, 5),
              calorias: item['calorias'],
              planoAlimentarId: item['plano_alimentar_id'],
              concluida: false,
            ),
          );

          return Refeicao(
            id: item['id'],
            nome: item['nome'],
            descricao: item['descricao'],
            horario: item['horario'].toString().substring(0, 5),
            calorias: item['calorias'],
            planoAlimentarId: item['plano_alimentar_id'],
            concluida: refeicaoSalva.concluida,
          );
        }).toList();

        await salvarRefeicoes(refeicoes);

        return true;
      }

      return false;

    } catch (e) {
      print('Erro ao carregar plano alimentar: $e');
      return false;
    }
  }

  static Future<void> marcarConcluida(
      int id, bool concluida) async {

    List<Refeicao> refeicoes =
    await LocalStorageService.carregarRefeicoes();

    List<Refeicao> atualizadas = refeicoes.map((r) {
      if (r.id == id) {
        return r.copyWith(concluida: concluida);
      }

      return r;
    }).toList();

    await LocalStorageService.salvarRefeicoes(atualizadas);
  }

  static Future<void> resetarRefeicoesSeNovoDia() async {
    final prefs = await SharedPreferences.getInstance();

    final hoje = DateTime.now();
    final hojeString =
        '${hoje.year}-${hoje.month}-${hoje.day}';

    final ultimoDia =
    prefs.getString('ultimo_dia_refeicoes');

    if (ultimoDia == null) {
      await prefs.setString(
        'ultimo_dia_refeicoes',
        hojeString,
      );
      return;
    }

    if (ultimoDia != hojeString) {
      final refeicoes =
      await LocalStorageService.carregarRefeicoes();

      final atualizadas = refeicoes.map((r) {
        return r.copyWith(concluida: false);
      }).toList();

      await LocalStorageService.salvarRefeicoes(atualizadas);

      await prefs.setString(
        'ultimo_dia_refeicoes',
        hojeString,
      );
    }
  }
}