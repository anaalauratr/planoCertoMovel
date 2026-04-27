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
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            //colocar a imagem no centro
                            child: Image.asset(
                              "assets/imagens/logoPlanoCerto1.png",
                              width: 250,
                            ),
                          ),
                          SizedBox(height: 4),
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
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome do plano",
                                  style: EstilosTextosCustomizado.formField(
                                      context),
                                ),

                                SizedBox(height: 15),
                                //listagem  de refeicoes concluidas
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
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
