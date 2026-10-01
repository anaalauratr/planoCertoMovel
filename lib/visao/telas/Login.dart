import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/telas/Splash2.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/modelo/Objects/autorizacao.dart';
import 'package:login/modelo/local_storage_service.dart';


import 'package:login/controle/AutorizaController.dart';


class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

//classe atualizável da tela
class _LoginState extends State<Login> {
  // 1. Definição da FormKey para controlar a validação do formulário
  final _formKey = GlobalKey<FormState>();

  // 2. Definição dos Controladores para capturar e manipular o texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // IMPORTANTE: Sempre limpe os controladores para evitar vazamento de memória
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Evento do botão entrar
  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {

      Autorizacao auth = Autorizacao(
        usuario: _emailController.text,
        senha: _passwordController.text,
        token_autorizacao: '',
      );

      String? mensagem =
      await AutorizaController.verificaAutorizacaoOnline(auth);

      if (!mounted) return;

      if (mensagem == null) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Usuário autenticado: ${auth.usuario}',
            ),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Splash2(),
          ),
        );

      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensagem),
            backgroundColor: Colors.red,
          ),
        );

      }
    }
  }

  //método de construção da interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/imagens/logoPlanoCerto1.png",
                width: 250,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF95B634),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF95B634),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'É preciso inserir seu e-mail';
                        }
                        if (!value.contains('@')) {
                          return 'O e-mail deve conter um @';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF95B634),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF95B634),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: _enviarFormulario,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF95B634),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Entrar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),



    );
  }
}