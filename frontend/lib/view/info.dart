import 'package:cep/store/info_store.dart';
import 'package:cep/store/map_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1505FF),
          title: Text("Informações adquiridas"),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.globe),
              onPressed: () async {
                await mapStore.buscarCepMap(mapStore.cep);
                Navigator.of(context).pushNamed('/map');
              },
            ),
          ],
        ),
        body: Container(
            color: Colors.cyan[200],
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              spreadRadius: 2,
                              color: Colors.black,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75))
                        ],
                        color: Colors.cyan[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(top: 30, left: 40, right: 40),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Informações sobre endereço:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "CEP: ${infoStore.enderecoAtual.cep}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "RUA: ${infoStore.enderecoAtual.rua}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "BAIRRO: ${infoStore.enderecoAtual.bairro}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "CIDADE: ${infoStore.enderecoAtual.cidade}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "UF: ${infoStore.enderecoAtual.uf}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "CODIGO: ${infoStore.enderecoAtual.ibge}",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Observer(builder: (_) {
                      if (infoStore.enderecoAtual.uf == "PE") {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  spreadRadius: 2,
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            color: Colors.cyan[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(left: 40, right: 40),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Informações sobre domicilios em ${infoStore.enderecoAtual.cidade}:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Particulares ocupados: ${infoStore.domicilioAtual.part_ocupados}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Particulares não ocupados fechados: ${infoStore.domicilioAtual.part_nao_ocupados_fechados}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Particulares não ocupados ocasionais: ${infoStore.domicilioAtual.part_nao_ocupados_ocasional}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Particulares não ocupados vagos: ${infoStore.domicilioAtual.part_nao_ocupados_vagos}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Total particulares: ${infoStore.domicilioAtual.total_particulares}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Total coletivos: ${infoStore.domicilioAtual.total_coletivos}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Coletivos com morador: ${infoStore.domicilioAtual.coletivos_morador}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Coletivos sem morador: ${infoStore.domicilioAtual.coletivos_sem_morador}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center();
                      }
                    }),
                  ],
                ),
              ],
            )));
  }
}
