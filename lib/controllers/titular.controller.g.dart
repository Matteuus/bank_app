// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titular.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TitularController on _TitularControllerBase, Store {
  final _$isLoadingTitularAtom =
      Atom(name: '_TitularControllerBase.isLoadingTitular');

  @override
  bool get isLoadingTitular {
    _$isLoadingTitularAtom.reportRead();
    return super.isLoadingTitular;
  }

  @override
  set isLoadingTitular(bool value) {
    _$isLoadingTitularAtom.reportWrite(value, super.isLoadingTitular, () {
      super.isLoadingTitular = value;
    });
  }

  final _$isLoadingCartaoAtom =
      Atom(name: '_TitularControllerBase.isLoadingCartao');

  @override
  bool get isLoadingCartao {
    _$isLoadingCartaoAtom.reportRead();
    return super.isLoadingCartao;
  }

  @override
  set isLoadingCartao(bool value) {
    _$isLoadingCartaoAtom.reportWrite(value, super.isLoadingCartao, () {
      super.isLoadingCartao = value;
    });
  }

  final _$isLoadingTransacaoAtom =
      Atom(name: '_TitularControllerBase.isLoadingTransacao');

  @override
  bool get isLoadingTransacao {
    _$isLoadingTransacaoAtom.reportRead();
    return super.isLoadingTransacao;
  }

  @override
  set isLoadingTransacao(bool value) {
    _$isLoadingTransacaoAtom.reportWrite(value, super.isLoadingTransacao, () {
      super.isLoadingTransacao = value;
    });
  }

  final _$isLoadingEstadosAtom =
      Atom(name: '_TitularControllerBase.isLoadingEstados');

  @override
  bool get isLoadingEstados {
    _$isLoadingEstadosAtom.reportRead();
    return super.isLoadingEstados;
  }

  @override
  set isLoadingEstados(bool value) {
    _$isLoadingEstadosAtom.reportWrite(value, super.isLoadingEstados, () {
      super.isLoadingEstados = value;
    });
  }

  final _$isLoadingCidadesAtom =
      Atom(name: '_TitularControllerBase.isLoadingCidades');

  @override
  bool get isLoadingCidades {
    _$isLoadingCidadesAtom.reportRead();
    return super.isLoadingCidades;
  }

  @override
  set isLoadingCidades(bool value) {
    _$isLoadingCidadesAtom.reportWrite(value, super.isLoadingCidades, () {
      super.isLoadingCidades = value;
    });
  }

  final _$titularAtom = Atom(name: '_TitularControllerBase.titular');

  @override
  TitularModel get titular {
    _$titularAtom.reportRead();
    return super.titular;
  }

  @override
  set titular(TitularModel value) {
    _$titularAtom.reportWrite(value, super.titular, () {
      super.titular = value;
    });
  }

  final _$cartaoAtom = Atom(name: '_TitularControllerBase.cartao');

  @override
  CartaoModel get cartao {
    _$cartaoAtom.reportRead();
    return super.cartao;
  }

  @override
  set cartao(CartaoModel value) {
    _$cartaoAtom.reportWrite(value, super.cartao, () {
      super.cartao = value;
    });
  }

  final _$dropdownEstadoValueAtom =
      Atom(name: '_TitularControllerBase.dropdownEstadoValue');

  @override
  EstadoModel get dropdownEstadoValue {
    _$dropdownEstadoValueAtom.reportRead();
    return super.dropdownEstadoValue;
  }

  @override
  set dropdownEstadoValue(EstadoModel value) {
    _$dropdownEstadoValueAtom.reportWrite(value, super.dropdownEstadoValue, () {
      super.dropdownEstadoValue = value;
    });
  }

  final _$dropdownCidadeValueAtom =
      Atom(name: '_TitularControllerBase.dropdownCidadeValue');

  @override
  CidadeModel get dropdownCidadeValue {
    _$dropdownCidadeValueAtom.reportRead();
    return super.dropdownCidadeValue;
  }

  @override
  set dropdownCidadeValue(CidadeModel value) {
    _$dropdownCidadeValueAtom.reportWrite(value, super.dropdownCidadeValue, () {
      super.dropdownCidadeValue = value;
    });
  }

  final _$getTitularAsyncAction =
      AsyncAction('_TitularControllerBase.getTitular');

  @override
  Future<void> getTitular() {
    return _$getTitularAsyncAction.run(() => super.getTitular());
  }

  final _$alterarTitularAsyncAction =
      AsyncAction('_TitularControllerBase.alterarTitular');

  @override
  Future<void> alterarTitular(TitularModel titular) {
    return _$alterarTitularAsyncAction.run(() => super.alterarTitular(titular));
  }

  final _$getCartaoAsyncAction =
      AsyncAction('_TitularControllerBase.getCartao');

  @override
  Future<void> getCartao() {
    return _$getCartaoAsyncAction.run(() => super.getCartao());
  }

  final _$getTransacoesAsyncAction =
      AsyncAction('_TitularControllerBase.getTransacoes');

  @override
  Future<void> getTransacoes() {
    return _$getTransacoesAsyncAction.run(() => super.getTransacoes());
  }

  final _$alterarLimiteAsyncAction =
      AsyncAction('_TitularControllerBase.alterarLimite');

  @override
  Future<void> alterarLimite(String saldo, String limite) {
    return _$alterarLimiteAsyncAction
        .run(() => super.alterarLimite(saldo, limite));
  }

  final _$getEstadosAsyncAction =
      AsyncAction('_TitularControllerBase.getEstados');

  @override
  Future<ObservableList<EstadoModel>> getEstados() {
    return _$getEstadosAsyncAction.run(() => super.getEstados());
  }

  final _$getCidadesAsyncAction =
      AsyncAction('_TitularControllerBase.getCidades');

  @override
  Future<void> getCidades(String siglaEstado) {
    return _$getCidadesAsyncAction.run(() => super.getCidades(siglaEstado));
  }

  final _$_TitularControllerBaseActionController =
      ActionController(name: '_TitularControllerBase');

  @override
  dynamic setLoadingTitular(bool value) {
    final _$actionInfo = _$_TitularControllerBaseActionController.startAction(
        name: '_TitularControllerBase.setLoadingTitular');
    try {
      return super.setLoadingTitular(value);
    } finally {
      _$_TitularControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingTransacao(bool value) {
    final _$actionInfo = _$_TitularControllerBaseActionController.startAction(
        name: '_TitularControllerBase.setLoadingTransacao');
    try {
      return super.setLoadingTransacao(value);
    } finally {
      _$_TitularControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingCartao(bool value) {
    final _$actionInfo = _$_TitularControllerBaseActionController.startAction(
        name: '_TitularControllerBase.setLoadingCartao');
    try {
      return super.setLoadingCartao(value);
    } finally {
      _$_TitularControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingEstados(bool value) {
    final _$actionInfo = _$_TitularControllerBaseActionController.startAction(
        name: '_TitularControllerBase.setIsLoadingEstados');
    try {
      return super.setIsLoadingEstados(value);
    } finally {
      _$_TitularControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingCidades(bool value) {
    final _$actionInfo = _$_TitularControllerBaseActionController.startAction(
        name: '_TitularControllerBase.setIsLoadingCidades');
    try {
      return super.setIsLoadingCidades(value);
    } finally {
      _$_TitularControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingTitular: ${isLoadingTitular},
isLoadingCartao: ${isLoadingCartao},
isLoadingTransacao: ${isLoadingTransacao},
isLoadingEstados: ${isLoadingEstados},
isLoadingCidades: ${isLoadingCidades},
titular: ${titular},
cartao: ${cartao},
dropdownEstadoValue: ${dropdownEstadoValue},
dropdownCidadeValue: ${dropdownCidadeValue}
    ''';
  }
}
