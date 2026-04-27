import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/telas/Splash2.dart';

import 'package:login/visao/util/CustomIcons.dart';
import 'package:login/visao/estilos/EstilosBotoes.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/telas/Principal.dart';
import 'package:login/visao/util/SocialIcons.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

bool _entrarActive = false;
bool _cadastrarActive = true;

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _newEmailController = TextEditingController();
TextEditingController _newPasswordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  telaSplash2(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splash2()),
    );
  }

  Widget _showEntrar(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(30)),
        TextField(
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
          controller: _emailController,
          decoration: InputDecoration(
            hintText: Internacionalizacao.hintTextEmail,
            hintStyle: EstilosTextosCustomizado.formField(context),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
                width: 1.0,
              ),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(50)),
        TextField(
          obscureText: true,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: Internacionalizacao.hintTextPassword,
            hintStyle: EstilosTextosCustomizado.formField(context),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
                width: 1.0,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(80)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          onPressed: () {
            telaSplash2(context);
          },
          child: Text(
            "Acessar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ScreenUtil.init(
      context,
      designSize: const Size(750, 1304),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                Internacionalizacao.logoTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              Text(
                Internacionalizacao.logoSubTitle,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: _showEntrar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _alterarParaCadastrar() {
    _entrarActive = true;
    _cadastrarActive = false;
  }

  static void _alterarParaEntrar() {
    _entrarActive = false;
    _cadastrarActive = true;
  }
}

class Internacionalizacao {
  static String logoTitle = "PLANOCERTO";
  static String logoSubTitle = "TENHA ACESSO AS SUAS DIETAS";

  static String hintTextEmail = "Email";
  static String hintTextPassword = "Senha";

  static String hintTextNewPassword = "Crie uma senha";
}
