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
    return Scaffold(
        appBar: _appBar(),
        body: _screens[_currentIndex],
        bottomNavigationBar: _bottomNavigationBar());
  }

  /////////////////////////
  //variáveis
  int _currentIndex = 0;

  List<Widget> _screens = [
    new TelaUm(title: 'Primeira tela'),
    new TelaDois(title: 'Segunda tela'),
    new TelaTres(title: 'Terceira tela')
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
      backgroundColor: Color(0xFFF5F5DC),
      currentIndex: _currentIndex!,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Atualiza o índice
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color(0xFF95B634),
          ),
          label: Internacionalizacao.opt1,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.lunch_dining,
            color: Color(0xFF95B634),
          ),
          label: Internacionalizacao.opt2,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color(0xFF95B634),
          ),
          label: Internacionalizacao.opt3,
        ),
      ],
    );
  }
}

class Internacionalizacao {
  static String opt1 = "Inicio";
  static String opt2 = "Plano Alimentar";
  static String opt3 = "Perfil";
  static String titulo = "PlanoCerto";
}
