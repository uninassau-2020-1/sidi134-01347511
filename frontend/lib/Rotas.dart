import 'package:cep/view/home.dart';
import 'package:cep/view/info.dart';
import 'package:cep/view/map.dart';
import 'package:flutter/material.dart';

class Rotas {
  static Route<dynamic> gerarRotas(RouteSettings settings) {
    switch (settings.name) {
      case ("/home"):
        return MaterialPageRoute(builder: (_) => Home());
      case ("/info"):
        return MaterialPageRoute(builder: (_) => Info());
      case ("/map"):
        return MaterialPageRoute(builder: (_) => MapSample());
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }
}
