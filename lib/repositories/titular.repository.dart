import 'package:bank_app/api/api.dart';
import 'package:bank_app/models/cartao.model.dart';
import 'package:bank_app/models/cidade.model.dart';
import 'package:bank_app/models/estado.model.dart';
import 'package:bank_app/models/titular.model.dart';
import 'package:bank_app/models/transacao.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class TitularRepository {
  final api = GetIt.I.get<Api>();

  Future<TitularModel> getTitular() async {
    try {
      final Response response = await api.dio.get('/titular');
      final TitularModel titular = TitularModel.fromJson(response.data[0]);
      return titular;
    } on DioError {
      rethrow;
    }
  }

  Future<void> alterarTitular(TitularModel titular) async {
    try {
      await api.dio.put('/titular/1', data: {
        "nome": titular.nome,
        "foto": titular.foto,
        "email": titular.email,
        "telefone": titular.telefone,
        "cidade_id": titular.cidadeId,
        "cidade": titular.cidade,
        "estado_id": titular.estadoId,
        "estado": titular.estado,
        "cep": titular.cep,
        "rua": titular.rua,
        "numero": titular.numero,
        "conta": titular.conta,
      });
      // final CartaoModel cartao = CartaoModel.fromJson(response.data[0]);
      // return cartao;
    } on DioError {
      rethrow;
    }
  }

  Future<CartaoModel> getCartao() async {
    try {
      final Response response = await api.dio.get('/titular/1/cartao');
      final CartaoModel cartao = CartaoModel.fromJson(response.data[0]);
      return cartao;
    } on DioError {
      rethrow;
    }
  }

  Future<void> alterarLimite(String saldo, String limite) async {
    try {
      await api.dio
          .put('/titular/1/cartao/1', data: {"saldo": saldo, "limite": limite});
      // final CartaoModel cartao = CartaoModel.fromJson(response.data[0]);
      // return cartao;
    } on DioError {
      rethrow;
    }
  }

  Future<ObservableList<TransacaoModel>> getTransacoes() async {
    try {
      final Response response = await api.dio.get('/titular/1/tranferencias');
      List<TransacaoModel> transacoes = response.data
          .map<TransacaoModel>(
              (transacao) => TransacaoModel.fromJson(transacao))
          .toList();
      return transacoes.asObservable();
    } on DioError {
      rethrow;
    }
  }

  Future<ObservableList<EstadoModel>> getEstados() async {
    try {
      final Response response = await Dio()
          .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
      List<EstadoModel> estados = response.data
          .map<EstadoModel>((estado) => EstadoModel.fromJson(estado))
          .toList();
      return estados.asObservable();
    } on DioError {
      rethrow;
    }
  }

  Future<ObservableList<CidadeModel>> getCidades(String estadoSigla) async {
    try {
      final Response response = await Dio().get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoSigla/municipios');
      List<CidadeModel> estados = response.data
          .map<CidadeModel>((estado) => CidadeModel.fromJson(estado))
          .toList();
      return estados.asObservable();
    } on DioError {
      rethrow;
    }
  }
}
