import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class TelaUm extends StatefulWidget {
  const TelaUm({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaUm> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaUm> {
  @override
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
                          Center(
                            // qro q minha imagem de logo fique centralizada
                            child: Image.asset(
                              "assets/imagens/logoPlanoCerto1.png",
                              width: 250,
                            ),
                          ),
                          SizedBox(height: 4), //espaco vertical
                          Center(
                            child: Text(
                              Internacionalizacao.msg,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
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
                                        //cria o item da lista
                                        title: Text("Cafe da Manha"), //titulo
                                        subtitle: Text("07:00"), //subtitulp
                                        onTap: () {},
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
                                        onTap: () {},
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
      "Olá! Seja bem-vindo. Essas são suas refeições ja concluidas hoje!";

  static String titulo1 = "Início";
}
