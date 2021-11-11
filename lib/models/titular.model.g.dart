// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titular.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitularModel _$TitularModelFromJson(Map<String, dynamic> json) => TitularModel(
      nome: json['nome'] as String?,
      foto: json['foto'] as String?,
      email: json['email'] as String?,
      telefone: json['telefone'] as String?,
      cidadeId: json['cidade_id'] as String?,
      cidade: json['cidade'] as String?,
      estadoId: json['estado_id'] as String?,
      estado: json['estado'] as String?,
      cep: json['cep'] as String?,
      rua: json['rua'] as String?,
      numero: json['numero'] as String?,
      conta: json['conta'] == null
          ? null
          : ContaModel.fromJson(json['conta'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TitularModelToJson(TitularModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'foto': instance.foto,
      'email': instance.email,
      'telefone': instance.telefone,
      'cidade_id': instance.cidadeId,
      'cidade': instance.cidade,
      'estado_id': instance.estadoId,
      'estado': instance.estado,
      'cep': instance.cep,
      'rua': instance.rua,
      'numero': instance.numero,
      'conta': instance.conta?.toJson(),
      'id': instance.id,
    };
