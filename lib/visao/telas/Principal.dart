import 'package:flutter/material.dart';
import 'package:login/visao/telas/TelaPlanoAlimentar.dart';
import 'package:login/visao/telas/TelaPerfil.dart';
import 'package:login/visao/telas/TelaHome.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //construção da estrutura
  @override
  Widget build(BuildContext context) {
    return Scaffold( // vai ter em tds as telas, 1,2 e 3
        appBar: _appBar(),
        body: _screens[_currentIndex],
        bottomNavigationBar: _bottomNavigationBar());
  }

  //variáveis
  int _currentIndex = 0;


  final List<Widget> _screens = [
    TelaDois(title: 'Plano Alimentar'), // 0
    TelaUm(title: 'Concluídas'),         // 1
    TelaTres(title: 'Perfil'),           // 2
  ];

  @override
  void initState() {
    _currentIndex = 0;
  }

  //////////////////////////
  //widgets
  //barra de títulos
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Color(0xFF95B634),
      title: Text(
        Internacionalizacao.titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //barra de menu
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFF5F5DC), //cor do bottom
      currentIndex: _currentIndex!,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Atualiza o índice
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.lunch_dining,
            color: Color(0xFF95B634),
          ),
          label: "Plano Alimentar",
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.check_circle,
            color: Color(0xFF95B634),
          ),
          label: "Concluídas",
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color(0xFF95B634),
          ),
          label: "Perfil",
        ),
      ],
    );
  }
}

//mudei o texto e icones
class Internacionalizacao {

  static String titulo = "PlanoCerto";
}
