// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartao.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartaoModel _$CartaoModelFromJson(Map<String, dynamic> json) => CartaoModel(
      saldo: json['saldo'] as String?,
      limite: json['limite'] as String?,
      limiteUtilizado: json['limite_utilizado'] as String?,
      fechamentoFatura: json['fechamento_fatura'] as String?,
      valorFatura: json['valor_fatura'] as String?,
      id: json['id'] as String?,
      nomeCartao: json['nome_cartao'] as String?,
      titularId: json['titularId'] as String?,
    )
      ..limiteTotal = json['limite_total'] as String?
      ..numeroCartao = json['numero_cartao'] as String?;

Map<String, dynamic> _$CartaoModelToJson(CartaoModel instance) =>
    <String, dynamic>{
      'saldo': instance.saldo,
      'limite_total': instance.limiteTotal,
      'limite': instance.limite,
      'limite_utilizado': instance.limiteUtilizado,
      'fechamento_fatura': instance.fechamentoFatura,
      'valor_fatura': instance.valorFatura,
      'id': instance.id,
      'nome_cartao': instance.nomeCartao,
      'numero_cartao': instance.numeroCartao,
      'titularId': instance.titularId,
    };
