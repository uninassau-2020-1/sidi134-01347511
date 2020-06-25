class Endereco {
  String cep;
  String rua;
  String bairro;
  String cidade;
  String uf;
  String ibge;
  Endereco({this.cep, this.bairro, this.cidade, this.ibge, this.rua, this.uf});

  Endereco.fromMap(Map map) {
    this.cep = map["cep"];
    this.rua = map["logradouro"];
    this.bairro = map["bairro"];
    this.cidade = map["localidade"];
    this.ibge = map["ibge"];
    this.uf = map["uf"];
  }
}
