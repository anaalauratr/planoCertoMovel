import 'package:dio/dio.dart';
import 'package:login/modelo/Objects/autorizacao.dart';
import 'package:login/modelo/local_storage_service.dart';
import 'package:login/modelo/api/Sincroniza.dart';

class AutorizaController {

  static Future<void> gravaAutorizacao(
      String usuario,
      String token
      ) async {

    Autorizacao auth = Autorizacao(
      usuario: usuario,
      senha: '',
      token_autorizacao: token,
    );

    await LocalStorageService.salvarAutorizacao(auth);
  }

  static Future<void> desgravaAutorizacao() async {
    await LocalStorageService.desgravarAutorizacao();
  }

  /// Faz login através da API
  static Future<String?> verificaAutorizacaoOnline(
      Autorizacao auth) async {
    try {
      Response response = await Sincroniza().requestLogin(
        auth.usuario,
        auth.senha,
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];

        await gravaAutorizacao(auth.usuario, token);

        return null; // login deu certo
      }

      return 'Erro ao realizar login.';
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data['message'] ?? 'Erro ao realizar login.';
      }

      return 'Não foi possível conectar ao servidor.';
    } catch (e) {
      return 'Erro ao realizar login.';
    }
  }

  /// Verifica se existe uma autorização salva
  static Future<bool> verificaAutorizacaoOffline() async {

    Autorizacao? auth =
    await LocalStorageService.carregarAutorizacao();

    if (auth == null) {
      return false;
    }

    return true;
  }
}