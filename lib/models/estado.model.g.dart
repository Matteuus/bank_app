// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstadoModel _$EstadoModelFromJson(Map<String, dynamic> json) => EstadoModel(
      id: json['id'] as int?,
      sigla: json['sigla'] as String?,
      nome: json['nome'] as String?,
    );

Map<String, dynamic> _$EstadoModelToJson(EstadoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sigla': instance.sigla,
      'nome': instance.nome,
    };
