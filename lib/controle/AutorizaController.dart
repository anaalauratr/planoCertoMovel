import 'package:login/modelo/Objects/autorizacao.dart';
import 'package:login/modelo/local_storage_service.dart';

class AutorizaController {
  static Future<void> gravaAutorizacao(String usuario, String token) async {
    Autorizacao auth = Autorizacao(usuario: usuario, senha: '', token_autorizacao: token);
    //salvando autorizacao persistida
    await LocalStorageService.salvarAutorizacao(auth);
  }

  static Future<void> desgravaAutorizacao() async {
    await LocalStorageService.desgravarAutorizacao();
  }

  /// Função fake de autenticação na API de forma positiva
  static Future<bool> verificaAutorizacaoOnline(Autorizacao auth) async {
    //faço a chamada à API enviando o json do meu objeto de autorizacao
    //envio este json para a API para obter o token
    //json.encode(auth.toMap());
    //simula o retorno da api
    if (auth.usuario == '123456@' && auth.senha == '123456') {
      Autorizacao authApiRetorno = Autorizacao(
        usuario: "fera",
        senha: '',
        token_autorizacao: "alskdfsoiu23jbdvocuiyvhkjqerb-iudfhnsbdkljqghoi",
      );
      gravaAutorizacao(authApiRetorno.usuario, authApiRetorno.token_autorizacao);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> verificaAutorizacaoOffline() async {
    Autorizacao? auth = await LocalStorageService.carregarAutorizacao();
    if (auth == null) return false;
    return true;
  }
}