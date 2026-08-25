import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/controle/RefeicaoController.dart';
import 'package:login/modelo/Objects/refeicao.dart';

import '../util/WidgetsUteis.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key, required this.title});

  final String title;

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  List<Refeicao> refeicoes = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarRefeicoes();
  }

  Future<void> _carregarRefeicoes() async {
    await RefeicaoController.resetarRefeicoesSeNovoDia();

    var lista = await RefeicaoController.carregarRefeicoes();

    if (lista.isEmpty) {
      lista = [
        Refeicao(
          id: 0,
          nome: "Café da Manhã",
          descricao: "Pão integral com ovo",
          horario: "07:00",
          calorias: 300,
          planoAlimentarId: 0,
        ),
        Refeicao(
          id: 1,
          nome: "Lanche",
          descricao: "Maçã",
          horario: "10:00",
          calorias: 180,
          planoAlimentarId: 0,
        ),
        Refeicao(
          id: 2,
          nome: "Almoço",
          descricao: "Arroz e frango",
          horario: "12:30",
          calorias: 550,
          planoAlimentarId: 0,
        ),
        Refeicao(
          id: 3,
          nome: "Jantar",
          descricao: "Sopa",
          horario: "19:00",
          calorias: 400,
          planoAlimentarId: 0,
        ),
      ];

      await RefeicaoController.salvarRefeicoes(lista);
    }

    setState(() {
      refeicoes = lista;
      carregando = false;
    });
  }
//entender isso
  Future<void> _alternarConcluida(Refeicao refeicao) async {
    final novoValor = !refeicao.concluida;

    await RefeicaoController.marcarConcluida(refeicao.id, novoValor,);

    setState(() {
      final index = refeicoes.indexWhere((r) => r.id == refeicao.id); //na msm posicao, id onde essa refeicao ta eu atualizo ela com o noco valor, q np caso é concluida = true

      if (index != -1) {
        refeicoes[index] = refeicoes[index].copyWith(concluida: novoValor);
      }
    });
  }

  void exibirRefeicao(BuildContext context, Refeicao refeicao) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            refeicao.nome,
            style: const TextStyle(
              color: Color(0xFF7B9738),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  refeicao.descricao,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF95B634),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "${refeicao.calorias} calorias",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF95B634),
                  ),
                ),
              ],
            ),
          ),
          actions: [ //entender isso
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: refeicao.concluida
                  ? null
                  : () async {
                await _alternarConcluida(refeicao);

                if (!dialogContext.mounted) return;

                Navigator.pop(dialogContext);
              },
              child: Text(
                refeicao.concluida
                    ? "Concluída"
                    : "Marcar como concluída",
                style: const TextStyle(
                  color: Color(0xFF7B9738),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1304));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Internacionalizacao.titulo,
          style: EstilosTextosCustomizado.formField(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Internacionalizacao.texto,
                          style: EstilosTextosCustomizado.formField(context),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Internacionalizacao.descricao,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Internacionalizacao.datas,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        if (carregando)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: refeicoes.length,
                            itemBuilder: (context, index) {
                              final refeicao = refeicoes[index];

                              return Card(
                                color: refeicao.concluida
                                    ? const Color(0xFFE3EFCB)
                                    : const Color(0xFFF5F5DC),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xFF95B634),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  title: Text(refeicao.nome),
                                  subtitle: Text(refeicao.horario),
                                  trailing: refeicao.concluida
                                      ? const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF7B9738),
                                  )
                                      : const Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey,
                                  ),
                                  onTap: () =>
                                      exibirRefeicao(context, refeicao),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Internacionalizacao {
  static String texto = "Nome do plano alimentar";
  static String descricao = "Esse plano alimentar tem intuito de... ";
  static String datas = "Data de início: 06/04/2025. Fim 06/06/2025";
  static String titulo = "Planos Alimentares";
}