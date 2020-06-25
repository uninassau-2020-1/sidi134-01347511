class UserModel {
  int id;
  String username;
  String password;

  UserModel(
      {this.id, this.username, this.password});

  // Instancia um usuário a partir de um json
  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel(username: json["usuario"]["username"], id: json["usuario"]["id"]);
  }

  UserModel.fromMap(Map map) {
    this.username = map["usuario"]["username"];
    this.id = map["usuario"]["id"];
  }

  // Retorna um json com os dados do usuário
  Map<String, dynamic> toJson() =>
      {"username": this.username, "password": this.password};

  @override
  String toString() => "User { username: $username }";
}
