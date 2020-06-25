
import 'package:cep/model/user_model.dart';
import 'package:cep/repository/usuario_repository.dart';
import 'package:cep/util/enums.dart';
import 'package:mobx/mobx.dart';

part 'autenticacao_store.g.dart';

class AutenticacaoStore = _AutenticacaoStoreBase with _$AutenticacaoStore;
final AutenticacaoStore autenticacaoStore = AutenticacaoStore();

abstract class _AutenticacaoStoreBase with Store {
  UsuarioRepository repository = UsuarioRepository();

  @observable
  EstadoAtualLogin estadoAtual = EstadoAtualLogin.APP_START;
  @observable
  UserModel usuarioAtual;
  @observable
  bool erroLogin = false;
  @observable
  bool showPassword = true;

  @action
  efetuarLogin(String username, String password) async {
    try {
      estadoAtual = EstadoAtualLogin.AUTHENTICATING;
      final UserModel usuarioAutenticado = await repository.efetuarLogin(username: username, password: password);
      usuarioAtual = usuarioAutenticado;
      estadoAtual = EstadoAtualLogin.AUTHENTICATED;
      changeErrorLogin(false);
    } catch (e) {
      estadoAtual = EstadoAtualLogin.UNAUTENTICATED;
      changeErrorLogin(true);
    }
  }

  @action
  changeErrorLogin(bool value) {
    erroLogin = value;
  }

  @action
  void changePwdType() {
    showPassword = !showPassword;
  }

  @action
  efetuarLogout() async {
    try {
      await repository.efetuarLogout();
      erroLogin = false;
      estadoAtual = EstadoAtualLogin.UNAUTENTICATED;
    } catch (e) {
      estadoAtual = EstadoAtualLogin.AUTHENTICATED;
    }
  }
}
