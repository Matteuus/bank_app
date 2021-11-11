import 'package:json_annotation/json_annotation.dart';

part 'cidade.model.g.dart';

@JsonSerializable(explicitToJson: true)
class CidadeModel {
  int? id;
  String? nome;

  CidadeModel({this.id, this.nome});

  factory CidadeModel.fromJson(Map<String, dynamic> json) =>
      _$CidadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CidadeModelToJson(this);
}
