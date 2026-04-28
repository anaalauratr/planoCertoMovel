import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class TelaTres extends StatefulWidget {
  const TelaTres({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaTres> createState() => _TelaTresState();
}

class _TelaTresState extends State<TelaTres> {
  void alterarSenha(
    BuildContext context,
    //alert para mostrar que o botao de alterar senha foi clicado
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Alteracao de senha",
            style: TextStyle(
              color: Color(0xFF7B9738),
              fontWeight: FontWeight.bold, //negrito
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
          //cria outro app bar em baixo do padrao mostrando que esta no seu perfil
          Internacionalizacao.titulo1,
          style: EstilosTextosCustomizado.formField(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //centraliza horizontalmente no centro
        children: [
          SizedBox(height: 35),
          Icon(
            //icone de pessoa demosntrando que esta em perfil
            Icons.person,
            size: 60,
            color: Color(0xFF95B634),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ana Laura - sexo: feminino", //nome da pessoa e sexo
                style: TextStyle(
                  color: Color(0xFF95B634),
                  fontSize: 18,
                ),
                softWrap: true,
              ), // pode quebrar linha se for texto dms q n cabe na tela
            ],
          ),
          SizedBox(height: 35),
          Row(
            //crio uma linha com duas colunas para uma ficar na frente da outra
            children: [
              SizedBox(width: 40), //espaco horizontal da margem
              Column(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Column(
                //dx os elementos um em baixo do outro
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  Text(
                    "ana@gmail.com",
                    style: TextStyle(color: Color(0xFF95B634)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //alinhamento horizontal a esquerda
                children: [
                  Text("Data de Nascimento"),
                  Text(
                    "20/02/2009",
                    style: TextStyle(color: Color(0xFF95B634)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  Icon(Icons.monitor_weight),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Peso"),
                  Text(
                    "60 kg",
                    style: TextStyle(color: Color(0xFF95B634)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  Icon(Icons.height),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Altura"),
                  Text(
                    "1,60 m",
                    style: TextStyle(color: Color(0xFF95B634)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  Icon(Icons.flag),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Expanded(
                //faz ocupar todelo espaco disponil
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //geralmente objetivo pode vir escriyo mt coisa por isso o expanded para ocuṕar o maximo que der, mas se n caber na tela pd quebrar linha
                  children: [
                    Text("Objetivo"),
                    Text(
                      "Ganho de massa muscular e definicao, paciente doente...",
                      style: TextStyle(
                        color: Color(0xFF95B634),
                      ),
                      softWrap: true, // pode quebrar linha
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              alterarSenha(
                  context); //qnd clicar chamo a funcao alterar senha que exibo o alert
            },
            child: Text(
              //texto do botao
              "Alterar senha",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Internacionalizacao {
  static String titulo1 = "Perfil";
}
