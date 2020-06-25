import 'package:cep/store/autenticacao_store.dart';
import 'package:cep/util/enums.dart';
import 'package:cep/view/home.dart';
import 'package:cep/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'Rotas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Observer(builder: (_) {
        if (autenticacaoStore.estadoAtual == EstadoAtualLogin.AUTHENTICATED) {
          return Home();
        } else if (autenticacaoStore.estadoAtual ==
                EstadoAtualLogin.UNAUTENTICATED ||
            autenticacaoStore.estadoAtual == EstadoAtualLogin.AUTHENTICATING) {
          return Login();
        } else {
          return Login();
        }
      }),
      onGenerateRoute: Rotas.gerarRotas,
      debugShowCheckedModeBanner: false,
    );
  }
}
