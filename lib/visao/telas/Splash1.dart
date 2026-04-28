//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/util/CustomIcons.dart';

import 'package:login/visao/telas/Splash1.dart';
import 'package:login/visao/util/SocialIcons.dart';

//import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:login/main.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

import 'Login.dart';

//classe inicial da tela
class Splash1 extends StatefulWidget {
  @override
  _Splash1State createState() => _Splash1State();
}

//classe altualizavel da tela
class _Splash1State extends State<Splash1> {
  //método de inicialização da tela
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login(title: 'Aplicativo')),
      );
    });
  }

//método de construção da interface da tela
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/imagens/logoPlanoCerto1.png", //imagem de logo
              width: 350,
            ),

            WidgetsUteis().espacoHorizontal15,
            //CircularProgressIndicator(),
            WidgetsUteis().barraCircularProgresso(),
          ],
        ),
      ),
    );
  }
}
