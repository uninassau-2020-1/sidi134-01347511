import 'package:cep/endereco.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Endereco endereco;
  Info({@required this.endereco});
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Informações adquiridas"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "CEP selecionado: ${widget.endereco.cep}",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rua: ${widget.endereco.rua}",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bairro: ${widget.endereco.bairro}",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cidade: ${widget.endereco.cidade}",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "UF: ${widget.endereco.uf}",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "IBGE: ${widget.endereco.ibge}",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
  }
}
