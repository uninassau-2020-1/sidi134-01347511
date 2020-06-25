// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutenticacaoStore on _AutenticacaoStoreBase, Store {
  final _$estadoAtualAtom = Atom(name: '_AutenticacaoStoreBase.estadoAtual');

  @override
  EstadoAtualLogin get estadoAtual {
    _$estadoAtualAtom.reportRead();
    return super.estadoAtual;
  }

  @override
  set estadoAtual(EstadoAtualLogin value) {
    _$estadoAtualAtom.reportWrite(value, super.estadoAtual, () {
      super.estadoAtual = value;
    });
  }

  final _$usuarioAtualAtom = Atom(name: '_AutenticacaoStoreBase.usuarioAtual');

  @override
  UserModel get usuarioAtual {
    _$usuarioAtualAtom.reportRead();
    return super.usuarioAtual;
  }

  @override
  set usuarioAtual(UserModel value) {
    _$usuarioAtualAtom.reportWrite(value, super.usuarioAtual, () {
      super.usuarioAtual = value;
    });
  }

  final _$erroLoginAtom = Atom(name: '_AutenticacaoStoreBase.erroLogin');

  @override
  bool get erroLogin {
    _$erroLoginAtom.reportRead();
    return super.erroLogin;
  }

  @override
  set erroLogin(bool value) {
    _$erroLoginAtom.reportWrite(value, super.erroLogin, () {
      super.erroLogin = value;
    });
  }

  final _$showPasswordAtom = Atom(name: '_AutenticacaoStoreBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$efetuarLoginAsyncAction =
      AsyncAction('_AutenticacaoStoreBase.efetuarLogin');

  @override
  Future efetuarLogin(String username, String password) {
    return _$efetuarLoginAsyncAction
        .run(() => super.efetuarLogin(username, password));
  }

  final _$efetuarLogoutAsyncAction =
      AsyncAction('_AutenticacaoStoreBase.efetuarLogout');

  @override
  Future efetuarLogout() {
    return _$efetuarLogoutAsyncAction.run(() => super.efetuarLogout());
  }

  final _$_AutenticacaoStoreBaseActionController =
      ActionController(name: '_AutenticacaoStoreBase');

  @override
  dynamic changeErrorLogin(bool value) {
    final _$actionInfo = _$_AutenticacaoStoreBaseActionController.startAction(
        name: '_AutenticacaoStoreBase.changeErrorLogin');
    try {
      return super.changeErrorLogin(value);
    } finally {
      _$_AutenticacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePwdType() {
    final _$actionInfo = _$_AutenticacaoStoreBaseActionController.startAction(
        name: '_AutenticacaoStoreBase.changePwdType');
    try {
      return super.changePwdType();
    } finally {
      _$_AutenticacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estadoAtual: ${estadoAtual},
usuarioAtual: ${usuarioAtual},
erroLogin: ${erroLogin},
showPassword: ${showPassword}
    ''';
  }
}
