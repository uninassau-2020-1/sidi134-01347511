class Domicilio {
  String cod_municipio;
  String nome_municipio;
  String part_ocupados;
  String part_nao_ocupados_fechados;
  String part_nao_ocupados_ocasional;
  String part_nao_ocupados_vagos;
  String total_particulares;
  String coletivos_morador;
  String coletivos_sem_morador;
  String total_coletivos;
  Domicilio(
      {this.cod_municipio,
      this.nome_municipio,
      this.part_ocupados,
      this.part_nao_ocupados_fechados,
      this.part_nao_ocupados_ocasional,
      this.part_nao_ocupados_vagos,
      this.total_particulares,
      this.total_coletivos,
      this.coletivos_morador,
      this.coletivos_sem_morador});

  Domicilio.fromMap(Map map) {
    this.cod_municipio = map["cod_municipio"].toString();
    this.nome_municipio = map["nome_municipio"];
    this.part_ocupados = map["part_ocupados"];
    this.part_nao_ocupados_fechados = map["part_nao_ocupados_fechados"];
    this.part_nao_ocupados_ocasional = map["part_nao_ocupados_ocasional"];
    this.part_nao_ocupados_vagos = map["part_nao_ocupados_vagos"];
    this.total_particulares = map["total_particulares"];
    this.total_coletivos = map["total_coletivos"];
    this.coletivos_morador = map["coletivos_morador"];
    this.coletivos_sem_morador = map["coletivos_sem_morador"];
  }

    @override
  String toString() => "User { Codigo do municipio: $cod_municipio / nome_municipio: $nome_municipio}";
}
