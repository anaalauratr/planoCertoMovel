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
  bool concluida1 = false;
  bool concluida2 = false;
  bool concluida3 = false;
  bool concluida4 = false;

  void exibirRefeicao(
    BuildContext context,
    String nome,
    String descricao,
    String calorias,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            nome,
            style: TextStyle(
              color: Color(0xFF7B9738),
              fontWeight: FontWeight.bold, //negrito
            ),
          ),
          content: SizedBox(
            width: 400, // controla largura do dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, //alinhar a esquerda
              children: [
                Text(
                  descricao,
                  textAlign: TextAlign.left, // garante alinhamento
                  softWrap: true, // permite quebrar linha
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color(0xFF95B634),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  calorias,
                  textAlign: TextAlign.left,
                  softWrap: true,
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
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
            Internacionalizacao.titulo,
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
                            Internacionalizacao.texto,
                            style: EstilosTextosCustomizado.formField(context),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Internacionalizacao.descricao,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Internacionalizacao.datas,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15),

                          //listagem refeicoes do plano
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
                                  trailing: Checkbox(
                                    value: concluida1,
                                    onChanged: (bool? valor) {
                                      setState(() {
                                        concluida1 = valor!;
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
