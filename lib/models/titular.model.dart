import 'package:bank_app/models/conta.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'titular.model.g.dart';

@JsonSerializable(explicitToJson: true)
class TitularModel {
  String? nome;
  String? foto;
  String? email;
  String? telefone;
  @JsonKey(name: 'cidade_id')
  String? cidadeId;
  String? cidade;
  @JsonKey(name: 'estado_id')
  String? estadoId;
  String? estado;
  String? cep;
  String? rua;
  String? numero;

  @JsonKey(name: 'conta')
  ContaModel? conta;
  String? id;

  TitularModel(
      {this.nome,
      this.foto,
      this.email,
      this.telefone,
      this.cidadeId,
      this.cidade,
      this.estadoId,
      this.estado,
      this.cep,
      this.rua,
      this.numero,
      this.conta,
      this.id});

  factory TitularModel.fromJson(Map<String, dynamic> json) =>
      _$TitularModelFromJson(json);

  Map<String, dynamic> toJson() => _$TitularModelToJson(this);
}
