// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoStore on _InfoStoreBase, Store {
  final _$enderecoAtualAtom = Atom(name: '_InfoStoreBase.enderecoAtual');

  @override
  Endereco get enderecoAtual {
    _$enderecoAtualAtom.reportRead();
    return super.enderecoAtual;
  }

  @override
  set enderecoAtual(Endereco value) {
    _$enderecoAtualAtom.reportWrite(value, super.enderecoAtual, () {
      super.enderecoAtual = value;
    });
  }

  final _$domicilioAtualAtom = Atom(name: '_InfoStoreBase.domicilioAtual');

  @override
  Domicilio get domicilioAtual {
    _$domicilioAtualAtom.reportRead();
    return super.domicilioAtual;
  }

  @override
  set domicilioAtual(Domicilio value) {
    _$domicilioAtualAtom.reportWrite(value, super.domicilioAtual, () {
      super.domicilioAtual = value;
    });
  }

  final _$jsonAtom = Atom(name: '_InfoStoreBase.json');

  @override
  Map<String, dynamic> get json {
    _$jsonAtom.reportRead();
    return super.json;
  }

  @override
  set json(Map<String, dynamic> value) {
    _$jsonAtom.reportWrite(value, super.json, () {
      super.json = value;
    });
  }

  final _$buscarCepAsyncAction = AsyncAction('_InfoStoreBase.buscarCep');

  @override
  Future<Endereco> buscarCep(String cep) {
    return _$buscarCepAsyncAction.run(() => super.buscarCep(cep));
  }

  final _$buscarInfosAsyncAction = AsyncAction('_InfoStoreBase.buscarInfos');

  @override
  Future<Domicilio> buscarInfos(String ibge) {
    return _$buscarInfosAsyncAction.run(() => super.buscarInfos(ibge));
  }

  final _$_InfoStoreBaseActionController =
      ActionController(name: '_InfoStoreBase');

  @override
  dynamic limparEnderecoAtual() {
    final _$actionInfo = _$_InfoStoreBaseActionController.startAction(
        name: '_InfoStoreBase.limparEnderecoAtual');
    try {
      return super.limparEnderecoAtual();
    } finally {
      _$_InfoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enderecoAtual: ${enderecoAtual},
domicilioAtual: ${domicilioAtual},
json: ${json}
    ''';
  }
}
