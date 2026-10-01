import 'package:dio/dio.dart';

class Sincroniza {

  static String LOGIN_API = "http://planocerto.test/api/login";
  static String ME_API = "http://planocerto.test/api/me";
  static String LOGOUT_API = "http://planocerto.test/api/logout";
  static String CLIENTE_API = "http://planocerto.test/api/cliente";
  static String CLIENTE_PLANO_API = "http://planocerto.test/api/cliente/plano";

  // Login
  Future<Response> requestLogin(
      String email,
      String password
      ) async {

    final dio = Dio();

    return await dio.post(
      LOGIN_API,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  // Dados do cliente
  Future<Response> requestCliente(String token) async {

    final dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Accept'] = 'application/json';

    return await dio.get(CLIENTE_API);
  }

  // Plano alimentar do cliente
  Future<Response> requestClientePlano(String token) async {

    final dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Accept'] = 'application/json';

    return await dio.get(CLIENTE_PLANO_API);
  }

  // Logout
  Future<Response> requestLogout(String token) async {

    final dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Accept'] = 'application/json';

    return await dio.post(LOGOUT_API);
  }
}