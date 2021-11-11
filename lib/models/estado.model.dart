import 'package:json_annotation/json_annotation.dart';

part 'estado.model.g.dart';

@JsonSerializable(explicitToJson: true)
class EstadoModel {
  int? id;
  String? sigla;
  String? nome;

  EstadoModel({this.id, this.sigla, this.nome});

  factory EstadoModel.fromJson(Map<String, dynamic> json) =>
      _$EstadoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstadoModelToJson(this);
}
