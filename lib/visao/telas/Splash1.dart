import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/controle/AutorizaController.dart';
import 'package:login/visao/telas/Splash2.dart';
import 'package:login/visao/util/WidgetsUteis.dart';
import 'Login.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    // mostra alguns segundos de splash antes de verificar o login
    Future.delayed(const Duration(seconds: 3), () async {
      await verificarLogin();
    });
  }

  Future<void> verificarLogin() async {
    if (!mounted) return;

    if (await AutorizaController.verificaAutorizacaoOffline()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Splash2()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(title: 'Aplicativo'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/imagens/logoPlanoCerto1.png",
              width: 350,
            ),
            WidgetsUteis().espacoHorizontal15,
            WidgetsUteis().barraCircularProgresso(),
          ],
        ),
      ),
    );
  }
}