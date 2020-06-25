// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on _MapStoreBase, Store {
  final _$posicaoAtom = Atom(name: '_MapStoreBase.posicao');

  @override
  LatLng get posicao {
    _$posicaoAtom.reportRead();
    return super.posicao;
  }

  @override
  set posicao(LatLng value) {
    _$posicaoAtom.reportWrite(value, super.posicao, () {
      super.posicao = value;
    });
  }

  final _$buscarCepMapAsyncAction = AsyncAction('_MapStoreBase.buscarCepMap');

  @override
  Future<LatLng> buscarCepMap(String cep) {
    return _$buscarCepMapAsyncAction.run(() => super.buscarCepMap(cep));
  }

  @override
  String toString() {
    return '''
posicao: ${posicao}
    ''';
  }
}
