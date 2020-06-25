import 'package:cep/model/domicilio.dart';
import 'package:cep/model/endereco.dart';
import 'package:cep/store/http_repository.dart';
import 'package:mobx/mobx.dart';

part 'info_store.g.dart';

class InfoStore = _InfoStoreBase with _$InfoStore;
final InfoStore infoStore = InfoStore();

abstract class _InfoStoreBase extends HttpRepository with Store {
  @observable
  Endereco enderecoAtual;
  @observable
  Domicilio domicilioAtual;

  @observable
  Map<String, dynamic> json;

  @action
  Future<Endereco> buscarCep(String cep) async {
    final response = await super
        .get(path: "http://www.viacep.com.br/ws/$cep/json/", passToken: true);
    print(response.toString());
    enderecoAtual = Endereco.fromMap(response);
    return enderecoAtual;
  }

  @action
  Future<Domicilio> buscarInfos(String ibge) async {
    final response = await super
        .get(path: 'http://192.168.0.74:8097/$ibge', passToken: true);
    print(response.toString());
    if (enderecoAtual.uf == "PE") {
      domicilioAtual = Domicilio.fromMap(response);
    }else{
      domicilioAtual = null;
    }

    return domicilioAtual;
  }

  @action
  limparEnderecoAtual() {
    enderecoAtual = null;
  }
}
