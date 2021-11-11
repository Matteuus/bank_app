import 'package:bank_app/models/cartao.model.dart';
import 'package:bank_app/models/cidade.model.dart';
import 'package:bank_app/models/estado.model.dart';
import 'package:bank_app/models/titular.model.dart';
import 'package:bank_app/models/transacao.model.dart';
import 'package:bank_app/repositories/titular.repository.dart';
import 'package:bank_app/widgets/custom_snackbar.widget.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'titular.controller.g.dart';

class TitularController = _TitularControllerBase with _$TitularController;

abstract class _TitularControllerBase with Store {
  final TitularRepository _titularRepository = GetIt.I<TitularRepository>();

  @observable
  bool isLoadingTitular = false;

  @observable
  bool isLoadingCartao = false;

  @observable
  bool isLoadingTransacao = false;

  @observable
  bool isLoadingEstados = false;

  @observable
  bool isLoadingCidades = false;

  @observable
  TitularModel titular = TitularModel();

  @observable
  CartaoModel cartao = CartaoModel();

  ObservableList<EstadoModel> estados = ObservableList<EstadoModel>();

  ObservableList<CidadeModel> cidades = ObservableList<CidadeModel>();

  ObservableList<TransacaoModel> transacoes = ObservableList<TransacaoModel>();

  @observable
  EstadoModel dropdownEstadoValue = EstadoModel();

  @observable
  CidadeModel dropdownCidadeValue = CidadeModel();

  @action
  setLoadingTitular(bool value) => isLoadingTitular = value;

  @action
  setLoadingTransacao(bool value) => isLoadingTransacao = value;

  @action
  setLoadingCartao(bool value) => isLoadingCartao = value;

  @action
  setIsLoadingEstados(bool value) => isLoadingEstados = value;

  @action
  setIsLoadingCidades(bool value) => isLoadingCidades = value;

  @action
  Future<void> getTitular() async {
    try {
      setLoadingTitular(true);
      titular = await _titularRepository.getTitular();
      dropdownEstadoValue = EstadoModel(
          id: int.parse(titular.estadoId.toString()), nome: titular.estado);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoadingTitular(false);
    }
  }

  @action
  Future<void> alterarTitular(TitularModel titular) async {
    try {
      setLoadingTitular(true);
      await _titularRepository.alterarTitular(titular);
      await getTitular();
      customSnackBar("Sucesso!", "Usuário alterado", 1);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoadingTitular(false);
    }
  }

  @action
  Future<void> getCartao() async {
    try {
      setLoadingCartao(true);
      cartao = await _titularRepository.getCartao();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoadingCartao(false);
    }
  }

  @action
  Future<void> getTransacoes() async {
    try {
      setLoadingTransacao(true);
      transacoes = await _titularRepository.getTransacoes();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoadingTransacao(false);
    }
  }

  @action
  Future<void> alterarLimite(String saldo, String limite) async {
    try {
      setLoadingCartao(true);
      await _titularRepository.alterarLimite(saldo, limite);
      await getCartao();
      customSnackBar("Sucesso!", "Limite alterado", 1);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoadingCartao(false);
    }
  }

  @action
  Future<ObservableList<EstadoModel>> getEstados() async {
    try {
      setIsLoadingEstados(true);
      estados = await _titularRepository.getEstados();
      return estados;
    } catch (e) {
      debugPrint(e.toString());
      return estados;
    } finally {
      setIsLoadingEstados(false);
    }
  }

  @action
  Future<void> getCidades(String siglaEstado) async {
    try {
      setIsLoadingCidades(true);
      cidades = await _titularRepository.getCidades(siglaEstado);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setIsLoadingCidades(false);
    }
  }
}
