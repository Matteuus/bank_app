import 'package:json_annotation/json_annotation.dart';

part 'conta.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContaModel {
  String? agencia;
  @JsonKey(name: 'nome_banco')
  String? nomeBanco;
  String? conta;
  String? digito;

  ContaModel({this.agencia, this.nomeBanco, this.conta, this.digito});

  factory ContaModel.fromJson(Map<String, dynamic> json) =>
      _$ContaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContaModelToJson(this);
}
