import 'package:cep/store/http_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Classe responsável pelas ações referentes ao controle de acesso da aplicação.
class UsuarioRepository extends HttpRepository {
  final String tokenKey = 'token';

  efetuarLogin({
    @required String username,
    @required String password,
  }) async {
    final Map<String, dynamic> response = await super.post(
      path: '/authenticate',
      data: {
        "email": username,
        "senha": password,
      },
      passToken: false,
    );
    print(response.toString());
    print(response[tokenKey]);
    this._salvarToken(response[tokenKey]);
  }

  _salvarToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(tokenKey, token);
  }

  Future<void> efetuarLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  Future<bool> possuiAutenticacao() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(tokenKey);
  }
}
