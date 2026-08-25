import 'package:login/modelo/Objects/refeicao.dart';
import 'package:login/modelo/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RefeicaoController {
  // Carrega a lista de refeições salva localmente
  static Future<List<Refeicao>> carregarRefeicoes() async {
    return await LocalStorageService.carregarRefeicoes();
  }

  // Salva a lista de refeições (ex: quando a API retornar o plano alimentar)
  static Future<void> salvarRefeicoes(List<Refeicao> refeicoes) async {
    await LocalStorageService.salvarRefeicoes(refeicoes);
  }

  /// Marca ou desmarca uma refeição como concluída, localizando pelo id
  /// e reescrevendo a lista inteira já persistida.
  static Future<void> marcarConcluida(int id, bool concluida) async {
    List<Refeicao> refeicoes = await LocalStorageService.carregarRefeicoes();

    print(refeicoes.length);
    List<Refeicao> atualizadas = refeicoes.map((r) { //pega as refeicoes da lista
      if (r.id == id) { //confere se o id dela é o id da refeicao selecionada
        return r.copyWith(concluida: concluida); // se encontrei a refeição que estou procurando devolvo uma copia dela com o valor de concluida atualizado
      }
      return r;
    }).toList();

    await LocalStorageService.salvarRefeicoes(atualizadas); //salvo essa refeicao agora atualizada como concluida
  }




  // Reseta as refeições quando começar um novo dia
  static Future<void> resetarRefeicoesSeNovoDia() async {
    final prefs = await SharedPreferences.getInstance(); //ultimo dia registrado

    final hoje = DateTime.now(); //data de hj
    final hojeString = '${hoje.year}-${hoje.month}-${hoje.day}';//tranformo a data de hj em texto

    final ultimoDia = prefs.getString('ultimo_dia_refeicoes'); //ultima vez q salvei, mudei, marquei a refeicao como concluida

    if (ultimoDia == null) {
      await prefs.setString('ultimo_dia_refeicoes', hojeString); //se n existir uma data ela passa a ser hj
      return;
    }

    if (ultimoDia != hojeString) { //se a data de concluida for diferente da data de hj, é um novo dia
      final refeicoes = await LocalStorageService.carregarRefeicoes(); //carrego as refeicoes

      final atualizadas = refeicoes.map((r) {
        return r.copyWith(concluida: false); //todas as refeicoes passam a ser nao concluidas
      }).toList();

      await LocalStorageService.salvarRefeicoes(atualizadas); //salvo as refeicoes atualizadas

      await prefs.setString('ultimo_dia_refeicoes', hojeString); //atualizo o dia salvo
    }
  }
}