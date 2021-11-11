import 'package:bank_app/controllers/titular.controller.dart';
import 'package:bank_app/models/cidade.model.dart';
import 'package:bank_app/models/estado.model.dart';
import 'package:bank_app/models/titular.model.dart';
import 'package:bank_app/utils/colors.contants.dart';
import 'package:bank_app/widgets/custom_button.dart';
import 'package:bank_app/widgets/custom_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class UserInformationPage extends StatefulWidget {
  const UserInformationPage({Key? key}) : super(key: key);

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  final TitularController titularController = GetIt.I.get<TitularController>();
  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();
  var cepController = TextEditingController();
  var ruaController = TextEditingController();
  var numeroController = TextEditingController();

  @override
  void initState() {
    nomeController.text = titularController.titular.nome.toString();
    emailController.text = titularController.titular.email.toString();
    telefoneController.text = titularController.titular.telefone.toString();
    cepController.text = titularController.titular.cep.toString();
    ruaController.text = titularController.titular.rua.toString();
    numeroController.text = titularController.titular.numero.toString();
    titularController.getEstados().then((value) {
      titularController.dropdownEstadoValue = titularController.estados
          .firstWhere((element) =>
              element.id ==
              int.parse(titularController.titular.estadoId.toString()));
      titularController
          .getCidades(titularController.dropdownEstadoValue.id.toString())
          .then((value) {
        titularController.dropdownCidadeValue = titularController.cidades
            .firstWhere((element) =>
                element.id ==
                int.parse(titularController.titular.cidadeId.toString()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Titular',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 32.h),
          child: Column(
            children: [
              CustomField(
                hintText: 'Nome',
                controller: nomeController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              CustomField(
                hintText: 'E-mail',
                controller: emailController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              CustomField(
                hintText: 'Telefone',
                controller: telefoneController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              Observer(builder: (_) {
                if (titularController.isLoadingEstados) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kPrimaryColor,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Estado")),
                      DropdownButton<EstadoModel>(
                        isExpanded: true,
                        alignment: Alignment.center,
                        dropdownColor: Theme.of(context).cardTheme.color,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        value: titularController.dropdownEstadoValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        borderRadius: BorderRadius.circular(10),
                        underline: const SizedBox(),
                        onChanged: (EstadoModel? newValue) {
                          setState(() {
                            titularController.dropdownEstadoValue =
                                newValue as EstadoModel;
                          });
                          titularController
                              .getCidades(newValue!.id.toString())
                              .then((value) {
                            titularController.dropdownCidadeValue =
                                titularController.cidades[0];
                          });
                        },
                        items: titularController.estados
                            .map<DropdownMenuItem<EstadoModel>>(
                                (EstadoModel value) {
                          return DropdownMenuItem<EstadoModel>(
                            value: value,
                            child: Text(value.nome.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
              }),
              Observer(builder: (_) {
                if (titularController.isLoadingCidades) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kPrimaryColor,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Cidade")),
                      DropdownButton<CidadeModel>(
                        isExpanded: true,
                        alignment: Alignment.center,
                        dropdownColor: Theme.of(context).cardTheme.color,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        value: titularController.dropdownCidadeValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        borderRadius: BorderRadius.circular(10),
                        underline: const SizedBox(),
                        onChanged: (CidadeModel? newValue) {
                          setState(() {
                            titularController.dropdownCidadeValue =
                                newValue as CidadeModel;
                          });
                        },
                        items: titularController.cidades
                            .map<DropdownMenuItem<CidadeModel>>(
                                (CidadeModel value) {
                          return DropdownMenuItem<CidadeModel>(
                            value: value,
                            child: Text(value.nome.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
              }),
              SizedBox(height: 32.h),
              CustomField(
                hintText: 'CEP',
                controller: cepController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              CustomField(
                hintText: 'Rua',
                controller: ruaController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              CustomField(
                hintText: 'Número',
                controller: numeroController,
                onChanged: (value) => setState(
                  () {},
                ),
              ),
              SizedBox(height: 32.h),
              Observer(builder: (_) {
                return CustomButton(
                  text: 'Alterar',
                  disabled: titularController.titular.nome.toString() ==
                          nomeController.text &&
                      titularController.titular.email.toString() ==
                          emailController.text &&
                      titularController.titular.telefone.toString() ==
                          telefoneController.text &&
                      titularController.dropdownEstadoValue.id ==
                          int.parse(
                              titularController.titular.estadoId.toString()) &&
                      titularController.dropdownCidadeValue.id ==
                          int.parse(
                              titularController.titular.cidadeId.toString()),
                  onTap: () {
                    TitularModel titular = TitularModel(
                      nome: nomeController.text,
                      email: emailController.text,
                      telefone: telefoneController.text,
                      cep: cepController.text,
                      rua: ruaController.text,
                      numero: numeroController.text,
                      cidadeId:
                          titularController.dropdownCidadeValue.id.toString(),
                      cidade: titularController.dropdownCidadeValue.nome,
                      estadoId:
                          titularController.dropdownEstadoValue.id.toString(),
                      estado: titularController.dropdownEstadoValue.nome,
                      foto: titularController.titular.foto,
                      conta: titularController.titular.conta,
                    );
                    Navigator.pop(context);
                    titularController.alterarTitular(titular).then((value) {});
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
