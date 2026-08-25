import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';
import 'package:login/controle/RefeicaoController.dart';
import 'package:login/modelo/Objects/refeicao.dart';

class TelaUm extends StatefulWidget {
  const TelaUm({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaUm> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaUm> {
  @override

  List<Refeicao> refeicoesConcluidas = [];
  bool carregando = true;


  @override
  void initState() {
    super.initState();
    carregarRefeicoesConcluidas();
  }

  Future<void> carregarRefeicoesConcluidas() async {
    await RefeicaoController.resetarRefeicoesSeNovoDia();

    final refeicoes = await RefeicaoController.carregarRefeicoes();

    setState(() {
      refeicoesConcluidas = refeicoes.where((r) => r.concluida).toList();

      carregando = false;
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1304));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            Internacionalizacao.titulo1,
            style: EstilosTextosCustomizado.formField(context),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            //pode rolar scroll, conteudo que nao cabe na tela inteira
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0), //margem interna
                child: Column(
                  children: [
                    Container(
                      // bloco retangular
                      width: double.infinity,
                      //ocupa o maximo de espaco horizontal possivel
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 4), //espaco vertical
                          Center(
                            child: Text(
                              Internacionalizacao.msg,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF95B634),
                              ),
                            ),
                          ),
                          SizedBox(height: 15), //espaco vertical

                          Container(
                            //bloco
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              //coloquei uma decoracao nele com a bordar circular e cor cinza
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //escrita alinhada  esquerda
                              children: [
                                Text(
                                  "Nome do plano",
                                  style: EstilosTextosCustomizado.formField(
                                      context),
                                ),

                                SizedBox(height: 15),

                                //listagem  de refeicoes concluidas
                                if (carregando)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                else if (refeicoesConcluidas.isEmpty)
                                  const Center(
                                    child: Text(
                                      "Nenhuma refeição concluída hoje.",
                                    ),
                                  )
                                else
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: refeicoesConcluidas.length,
                                    itemBuilder: (context, index) {
                                      final refeicao = refeicoesConcluidas[index];

                                      return Card(
                                        color: const Color(0xFFE3EFCB),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: Color(0xFF95B634),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.check_circle,
                                            color: Color(0xFF7B9738),
                                          ),
                                          title: Text(refeicao.nome),
                                          subtitle: Text(refeicao.horario),
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class Internacionalizacao {
  static String msg =
      "Essas são suas refeições ja concluidas hoje!";

  static String titulo1 = "Concluídas";
}
