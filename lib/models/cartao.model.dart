import 'package:json_annotation/json_annotation.dart';

part 'cartao.model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartaoModel {
  String? saldo;
  @JsonKey(name: 'limite_total')
  String? limiteTotal;
  String? limite;
  @JsonKey(name: 'limite_utilizado')
  String? limiteUtilizado;
  @JsonKey(name: 'fechamento_fatura')
  String? fechamentoFatura;
  @JsonKey(name: 'valor_fatura')
  String? valorFatura;
  String? id;
  @JsonKey(name: 'nome_cartao')
  String? nomeCartao;
  @JsonKey(name: 'numero_cartao')
  String? numeroCartao;
  String? titularId;

  CartaoModel(
      {this.saldo,
      this.limite,
      this.limiteUtilizado,
      this.fechamentoFatura,
      this.valorFatura,
      this.id,
      this.nomeCartao,
      this.titularId});
  factory CartaoModel.fromJson(Map<String, dynamic> json) =>
      _$CartaoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartaoModelToJson(this);
}
