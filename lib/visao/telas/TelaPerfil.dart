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
          Internacionalizacao.titulo1,
          style: EstilosTextosCustomizado.formField(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //centraliza horizontal
        children: [
          const SizedBox(height: 35),
          const Icon(
            Icons.person,
            size: 60,
            color: Color(0xFF95B634),
          ),
          const SizedBox(height: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ana Laura - sexo: feminino",
                style: TextStyle(
                  color: Color(0xFF95B634),
                  fontSize: 18,
                ),
                softWrap: true,
              ), // pode quebrar linha
            ],
          ),
          const SizedBox(height: 35),
          const Row(
            children: [
              SizedBox(width: 40),
              Column(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(width: 30),
              Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //geralmente objetivo pode vir escriyo mt coisa por isso o expanded
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
              alterarSenha(context);
            },
            child: Text(
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
