import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';
import 'package:login/modelo/api/Sincroniza.dart';
import 'package:login/modelo/local_storage_service.dart';
import 'package:intl/intl.dart';
import 'package:login/visao/telas/Login.dart';

class TelaTres extends StatefulWidget {
const TelaTres({super.key, required this.title});

final String title;

@protected
@override
State<TelaTres> createState() => _TelaTresState();
}

class _TelaTresState extends State<TelaTres> {
Map<String, dynamic>? dadosUsuario;
Map<String, dynamic>? dadosCliente;

bool carregando = true;

@override
void initState() {
super.initState();
carregarDadosCliente();
}

Future<void> carregarDadosCliente() async {
final auth = await LocalStorageService.carregarAutorizacao();

if (auth != null) {
try {
final response = await Sincroniza().requestCliente(
auth.token_autorizacao,
);

if (response.statusCode == 200) {
setState(() {
dadosUsuario = response.data['user'];
dadosCliente = response.data['cliente'];
carregando = false;
});
} else {
setState(() {
carregando = false;
});
}
} catch (e) {
print('Erro ao carregar dados do cliente: $e');

setState(() {
carregando = false;
});
}
} else {
setState(() {
carregando = false;
});
}
}

Future<void> fazerLogout() async {
  final auth = await LocalStorageService.carregarAutorizacao();

  if (auth != null) {
    try {
      await Sincroniza().requestLogout(
        auth.token_autorizacao,
      );
    } catch (e) {
      print('Erro no logout da API: $e');
    }
  }

  // Apaga o token/login salvo no celular
  await LocalStorageService.desgravarAutorizacao();

  if (!mounted) return;

  // Vai para o Login e apaga todas as telas anteriores
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const Login(title: 'Login'),
    ),
        (route) => false,
  );
}

void confirmarLogout() {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text(
"Sair",
style: TextStyle(
color: Color(0xFF7B9738),
fontWeight: FontWeight.bold,
),
),
content: Text(
"Tem certeza que deseja sair da sua conta?",
),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context);
},
child: Text(
"Cancelar",
style: TextStyle(
color: Colors.grey,
),
),
),
TextButton(
onPressed: () {
Navigator.pop(context);
fazerLogout();
},
child: Text(
"Sair",
style: TextStyle(
color: Color(0xFF95B634),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}

void alterarSenha(BuildContext context) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text(
"Alteracao de senha",
style: TextStyle(
color: Color(0xFF7B9738),
fontWeight: FontWeight.bold,
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
ScreenUtil.init(
context,
designSize: const Size(750, 1304),
);

return Scaffold(
appBar: AppBar(
title: Text(
Internacionalizacao.titulo1,
style: EstilosTextosCustomizado.formField(context),
),
),
body: carregando
? Center(
child: CircularProgressIndicator(
color: Color(0xFF95B634),
),
)
    : SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
SizedBox(height: 35),

Icon(
Icons.person,
size: 60,
color: Color(0xFF95B634),
),

SizedBox(height: 15),

Text(
"${dadosUsuario?['name'] ?? ''} - sexo: ${dadosCliente?['sexo'] ?? ''}",
style: TextStyle(
color: Color(0xFF95B634),
fontSize: 18,
),
softWrap: true,
textAlign: TextAlign.center,
),

SizedBox(height: 35),

Row(
children: [
SizedBox(width: 40),
Column(
children: [
Icon(Icons.email),
SizedBox(height: 10),
],
),
SizedBox(width: 30),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Email"),
Text(
dadosUsuario?['email'] ?? '',
style: TextStyle(
color: Color(0xFF95B634),
),
),
],
),
],
),

SizedBox(height: 15),

Row(
children: [
SizedBox(width: 40),
Column(
children: [
Icon(Icons.calendar_today),
SizedBox(height: 10),
],
),
SizedBox(width: 30),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Data de Nascimento"),
Text(
dadosCliente?['data_nascimento'] != null
? DateFormat('dd/MM/yyyy').format(
DateTime.parse(
dadosCliente!['data_nascimento'],
),
)
    : '',
style: TextStyle(
color: Color(0xFF95B634),
),
),
],
),
],
),

SizedBox(height: 15),

Row(
children: [
SizedBox(width: 40),
Column(
children: [
Icon(Icons.monitor_weight),
SizedBox(height: 10),
],
),
SizedBox(width: 30),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Peso"),
Text(
"${dadosCliente?['peso'] ?? ''} kg",
style: TextStyle(
color: Color(0xFF95B634),
),
),
],
),
],
),

SizedBox(height: 15),

Row(
children: [
SizedBox(width: 40),
Column(
children: [
Icon(Icons.height),
SizedBox(height: 10),
],
),
SizedBox(width: 30),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Altura"),
Text(
"${dadosCliente?['altura'] ?? ''} m",
style: TextStyle(
color: Color(0xFF95B634),
),
),
],
),
],
),

SizedBox(height: 15),

Row(
children: [
SizedBox(width: 40),
Column(
children: [
Icon(Icons.flag),
SizedBox(height: 10),
],
),
SizedBox(width: 30),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text("Objetivo"),
Text(
dadosCliente?['objetivo'] ?? '',
style: TextStyle(
color: Color(0xFF95B634),
),
softWrap: true,
),
],
),
),
],
),

SizedBox(height: 30),

ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor:
Theme.of(context).primaryColorLight,
),
onPressed: () {
alterarSenha(context);
},
child: Text(
"Alterar senha",
style: TextStyle(
color: Colors.white,
),
),
),

SizedBox(height: 10),

  ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
    onPressed: fazerLogout,
    icon: Icon(
      Icons.logout,
      color: Colors.white,
    ),
    label: Text(
      "Sair",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),

SizedBox(height: 30),
],
),
),
);
}
}

class Internacionalizacao {
static String titulo1 = "Perfil";
}
