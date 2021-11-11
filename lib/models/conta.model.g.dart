// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conta.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContaModel _$ContaModelFromJson(Map<String, dynamic> json) => ContaModel(
      agencia: json['agencia'] as String?,
      nomeBanco: json['nome_banco'] as String?,
      conta: json['conta'] as String?,
      digito: json['digito'] as String?,
    );

Map<String, dynamic> _$ContaModelToJson(ContaModel instance) =>
    <String, dynamic>{
      'agencia': instance.agencia,
      'nome_banco': instance.nomeBanco,
      'conta': instance.conta,
      'digito': instance.digito,
    };
