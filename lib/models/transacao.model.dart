import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'transacao.model.g.dart';

@JsonSerializable(explicitToJson: true)
class TransacaoModel {
  String? nome;
  String? data;
  String? valor;
  String? id;
  String? logo;
  String? titularId;

  TransacaoModel(
      {this.nome, this.data, this.valor, this.id, this.titularId, this.logo});

  String getDateFormatted() {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime(
        int.parse(data.toString().substring(0, 4)),
        int.parse(data.toString().substring(5, 7)),
        int.parse(data.toString().substring(8, 10)),
        int.parse(data.toString().substring(11, 13)),
        int.parse(data.toString().substring(14, 16)),
        int.parse(data.toString().substring(17, 19)),
      ),
    );
  }

  factory TransacaoModel.fromJson(Map<String, dynamic> json) =>
      _$TransacaoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransacaoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TransacaoModelList {
  @JsonKey(name: '')
  List<TransacaoModel>? transacoes;

  TransacaoModelList({this.transacoes});

  factory TransacaoModelList.fromJson(Map<String, dynamic> json) =>
      _$TransacaoModelListFromJson(json);

  Map<String, dynamic> toJson() => _$TransacaoModelListToJson(this);
}
