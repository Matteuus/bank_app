// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transacao.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransacaoModel _$TransacaoModelFromJson(Map<String, dynamic> json) =>
    TransacaoModel(
      nome: json['nome'] as String?,
      data: json['data'] as String?,
      valor: json['valor'] as String?,
      id: json['id'] as String?,
      titularId: json['titularId'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$TransacaoModelToJson(TransacaoModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'data': instance.data,
      'valor': instance.valor,
      'id': instance.id,
      'logo': instance.logo,
      'titularId': instance.titularId,
    };

TransacaoModelList _$TransacaoModelListFromJson(Map<String, dynamic> json) =>
    TransacaoModelList(
      transacoes: (json[''] as List<dynamic>?)
          ?.map((e) => TransacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransacaoModelListToJson(TransacaoModelList instance) =>
    <String, dynamic>{
      '': instance.transacoes?.map((e) => e.toJson()).toList(),
    };
