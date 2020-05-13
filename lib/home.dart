import 'package:cep/endereco.dart';
import 'package:cep/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<Endereco> buscarCep(String cep) async {
  var response = await http.get("http://www.viacep.com.br/ws/$cep/json/");
  var jsonResponse = convert.jsonDecode(response.body);
  return Endereco.fromMap(jsonResponse);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerCep = TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    String erro = "";
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Consultando Cep"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Digite a baixo o cep que deseja buscar.",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            TextField(
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]"))
              ],
              keyboardType: TextInputType.number,
              maxLengthEnforced: true,
              maxLength: 8,
              controller: _controllerCep,
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                if (_controllerCep.text.length < 8) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Você precisa digitar 8 caracteres'),
                    duration: Duration(seconds: 3),
                  ));
                } else {
                  Endereco endereco = await buscarCep(_controllerCep.text);
                  if (endereco.cep != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Info(endereco: endereco)));
                  } else {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Cep não encontrado.'),
                      duration: Duration(seconds: 3),
                    ));
                  }
                }
              },
              child: Text(
                "Buscar",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
