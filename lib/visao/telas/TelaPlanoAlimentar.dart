import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';

import '../../modelo/ItemListView.dart';
import '../util/WidgetsUteis.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  //estado inicial das checkbox
  bool concluida1 = false;
  bool concluida2 = false;
  bool concluida3 = false;
  bool concluida4 = false;

  void exibirRefeicao(
    //funcao de quando eu clicar no item da lista vou poder ver os dados da refeicao
    BuildContext context,
    String nome, //variaveis que vou passar por parametro depois
    String descricao,
    String calorias,
  ) {
    showDialog(
      //funcao que abre janela
      context: context, //vai aparecer no meu contexto, na minha propria tela
      builder: (BuildContext context) {
        //conteudo dentro do dialog, oq aparece dentro dele
        return AlertDialog(
          //pop-up ja vem com titulo, conteudo e botao pronto
          title: Text(
            nome, //estilizacao do meu texto do nome da refeicao
            style: TextStyle(
              color: Color(0xFF7B9738),
              fontWeight: FontWeight.bold, //negrito
            ),
          ),
          content: SizedBox(
            //meu conteudo dentro do dialogo
            width: 400,
            // controla largura do dialog, pra ficar maior que ele é normalmente
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //sem isso o dialog fica grande dms, ocupar o espaco apenas necessario
              crossAxisAlignment: CrossAxisAlignment.start,
              //alinhar a esquerda
              children: [
                Text(
                  descricao,
                  textAlign: TextAlign.left,
                  // garante alinhamento a esquerda
                  softWrap: true,
                  // permite quebrar linha, caso oq estiver escrito seja maior
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color(0xFF95B634),
                  ),
                ),
                SizedBox(height: 10), //espaco vertical
                Text(
                  calorias,
                  textAlign: TextAlign.left,
                  // garante alinhamento a esquerda
                  softWrap: true,
                  // permite quebrar linha, caso oq estiver escrito seja maior
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Color(0xFF95B634),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            // acoes do dialog
            TextButton(
              //texto clicavel
              onPressed: () {
                Navigator.pop(context); //quando for precionado fecha o alert
              },
              child: Text(
                //texto do botao
                "cancelar",
                style: TextStyle(
                  color: Colors.grey,
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
            //app bar em baixo do outro (q tem em tds as paginas) com o titulo da pagina e sua estilizacao
            Internacionalizacao.titulo,
            style: EstilosTextosCustomizado.formField(context),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            //scroll
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Color(0xFF95B634),
                            fontStyle: FontStyle.italic),
                        hintText: 'Pesquise',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF95B634),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      //conteiner para colocar informacoes do plano e dentro a listagem das refeicoes
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //alinhado a esquerda
                        children: [
                          Text(
                            Internacionalizacao.texto, //nome do plano
                            style: EstilosTextosCustomizado.formField(context),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Internacionalizacao.descricao, //descricao do plano
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Internacionalizacao.datas,
                            //data de inicio e fim do plano
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15),
                          //-------------------------------------------------------------------------------
                          //listagem refeicoes do plano
                          ListView(
                            //serve para mostrar uma lista de elementos um em baixo do outro
                            shrinkWrap: true,
                            //o listview vai ocupar apenas o espaco que precisa, se ajusta aos seus itens, precisa dar dentro de um scroll

                            children: [
                              Card(
                                //vem pronto para apresentar os itens de lista, comun nesses casos
                                //cor der fundo
                                color: Color(0xFFF5F5DC),
                                //por padrao suas bordas ja vao arredondadas, porem eu quis colocar uma cor em sua borda
                                //no  card nao existe a propriedade border

                                shape: RoundedRectangleBorder(
                                  //define o formato do card com bordas arredondadas
                                  side: BorderSide(
                                    //define uma borda, linha ao redor do card
                                    color: Color(0xFF95B634),
                                    width: 1, //expessura da borda fininha
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8), //coloquei quanto eu qro mh borda arredondada
                                ),

                                child: ListTile(
                                  title: Text("Cafe da Manha"),
                                  subtitle: Text("07:00"),
                                  //no trailing eu vou  criar um check box para controle das refeicoes concluidas
                                  trailing: Checkbox(
                                    value: concluida1,
                                    //digo o estado atual da checkbox, criei ela la em cima
                                    onChanged: (bool? valor) {
                                      //qnd clica na checkbox, valor é o novo estado true ou false
                                      setState(() {
                                        //atualiza a tela e redesenha
                                        concluida1 =
                                            valor!; //muda o valor da variavel para oposto do q ele é
                                        // ex concluida é true passa a ser false
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    //chamo a funcao de exibir refeicao e passo seus parametros
                                    exibirRefeicao(context, "cafe da manha",
                                        "ṕao com ovo", "300 calorias");
                                  },
                                ),
                              ),
                              Card(
                                //cor der fundo
                                color: Color(0xFFF5F5DC),
                                //no  card nao existe a propriedade border
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xFF95B634),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: ListTile(
                                  title: Text("Cafe da Manha"),
                                  subtitle: Text("07:00"),
                                  trailing: Checkbox(
                                    value: concluida2,
                                    onChanged: (bool? valor) {
                                      setState(() {
                                        concluida2 = valor!;
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    exibirRefeicao(context, "cafe da manha",
                                        "ṕao com ovo", "300 calorias");
                                  },
                                ),
                              ),
                              Card(
                                //cor der fundo
                                color: Color(0xFFF5F5DC),
                                //no  card nao existe a propriedade border
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xFF95B634),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: ListTile(
                                  title: Text("Cafe da Manha"),
                                  subtitle: Text("07:00"),
                                  trailing: Checkbox(
                                    value: concluida3,
                                    onChanged: (bool? valor) {
                                      setState(() {
                                        concluida3 = valor!;
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    exibirRefeicao(context, "cafe da manha",
                                        "ṕao com ovo", "300 calorias");
                                  },
                                ),
                              ),
                              Card(
                                //cor der fundo
                                color: Color(0xFFF5F5DC),
                                //no  card nao existe a propriedade border
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xFF95B634),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: ListTile(
                                  title: Text("Cafe da Manha"),
                                  subtitle: Text("07:00"),
                                  trailing: Checkbox(
                                    value: concluida4,
                                    onChanged: (bool? valor) {
                                      setState(() {
                                        concluida4 = valor!;
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    exibirRefeicao(context, "cafe da manha",
                                        "ṕao com ovo", "300 calorias");
                                  },
                                ),
                              ),
                            ],
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
  static String texto = "Nome do plano alimentar";
  static String descricao = "Esse plano alimentar tem intuito de... ";
  static String datas = "Data de início: 06/04/2025. Fim 06/06/2025";
  static String titulo = "Planos Alimentares";
}
