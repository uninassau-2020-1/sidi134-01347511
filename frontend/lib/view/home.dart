import 'package:cep/store/autenticacao_store.dart';
import 'package:cep/store/map_store.dart';
import 'package:cep/store/info_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerCep = TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff1505FF),
        title: Text("Consultando Cep"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {
              autenticacaoStore.efetuarLogout();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.cyan[200],
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Digite abaixo o cep que deseja buscar.",
                    style: TextStyle(color: Color(0xff1505FF), fontSize: 30, fontWeight: FontWeight.bold)),
                TextField(
                  cursorColor: Color(0xff1505FF),
                  style: TextStyle(color: Color(0xff1505FF)),
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9]"))
                  ],
                  keyboardType: TextInputType.number,
                  maxLengthEnforced: true,
                  maxLength: 8,
                  controller: _controllerCep,
                ),
                RaisedButton(
                  color: Color(0xff1505FF),
                  onPressed: () async {
                    infoStore.limparEnderecoAtual();
                    if (_controllerCep.text.length < 8) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Você precisa digitar 8 caracteres'),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      mapStore.cep = _controllerCep.text;
                      await infoStore.buscarCep(_controllerCep.text);
                      if (infoStore.enderecoAtual.cep != null) {
                        await infoStore
                            .buscarInfos(infoStore.enderecoAtual.ibge);
                        Navigator.of(context).pushNamed('/info');
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
        ),
      ),
    );
  }
}
