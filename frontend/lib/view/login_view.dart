import 'package:cep/store/autenticacao_store.dart';
import 'package:cep/util/constantes.dart';
import 'package:cep/util/enums.dart';
import 'package:cep/util/flush_bar.dart';
import 'package:cep/util/logging.dart';
import 'package:cep/util/permissao_girar_tela.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    Permissao.enableRotation();
  }

  @override
  Widget build(BuildContext context) {
    Permissao.portraitModeOnly();
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: imagemBackground, fit: BoxFit.cover)),
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 150, 30, 0),
                  child: Observer(builder: (_) {
                    return TextField(
                      autofocus: false,
                      controller: _controllerLogin,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      enabled: autenticacaoStore.estadoAtual ==
                              EstadoAtualLogin.AUTHENTICATING
                          ? false
                          : true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: autenticacaoStore.erroLogin
                                  ? Colors.red
                                  : Colors.white),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: autenticacaoStore.erroLogin
                                      ? Colors.red
                                      : Colors.white))),
                    );
                  })),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Observer(builder: (_) {
                    return TextField(
                      autofocus: false,
                      controller: _controllerSenha,
                      textAlign: TextAlign.center,
                      obscureText: autenticacaoStore.showPassword,
                      enabled: autenticacaoStore.estadoAtual ==
                              EstadoAtualLogin.AUTHENTICATING
                          ? false
                          : true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.white24,
                            icon: Icon(autenticacaoStore.showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: autenticacaoStore.changePwdType,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          labelText: "Senha",
                          labelStyle: TextStyle(
                              color: autenticacaoStore.erroLogin
                                  ? Colors.red
                                  : Colors.white),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: autenticacaoStore.erroLogin
                                      ? Colors.red
                                      : Colors.white))),
                    );
                  })),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                child: Observer(builder: (_) {
                  if (autenticacaoStore.estadoAtual !=
                      EstadoAtualLogin.AUTHENTICATING) {
                    return RaisedButton(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: () async {
                        await autenticacaoStore.efetuarLogin(
                            _controllerLogin.text.trim(),
                            _controllerSenha.text.trim());
                        if (autenticacaoStore.erroLogin == true) {
                          FlushBarClass.flushBar(
                              context, "Credenciais invalidas.");
                          Logger.error("Credenciais invalidas.");
                        }
                      },
                    );
                  } else {
                    return Center(
                        child: LinearProgressIndicator(
                      backgroundColor: Color(0xff014a3f),
                    ));
                  }
                }),
              ),
            ],
          )),
    );
  }
}
