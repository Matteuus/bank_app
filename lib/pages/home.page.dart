import 'package:bank_app/controllers/titular.controller.dart';
import 'package:bank_app/pages/card_details.page.dart';
import 'package:bank_app/pages/user.page.dart';
import 'package:bank_app/utils/colors.contants.dart';
import 'package:bank_app/widgets/card_transactions.widgets.dart';
import 'package:bank_app/widgets/credit_card.widget.dart';
import 'package:bank_app/widgets/credit_card_resumed.widget.dart';
import 'package:bank_app/widgets/user_information.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TitularController titularController = GetIt.I.get<TitularController>();

  @override
  void initState() {
    titularController.getTitular();
    titularController.getCartao();
    titularController.getTransacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 64.h, right: 64.h, top: 32.h),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPage(),
                  ),
                ),
                child: Observer(
                  builder: (_) => titularController.isLoadingTitular
                      ? const UserInformationWidget(
                          userName: 'Usuário',
                          userImage: 'assets/images/user.png',
                          isLoading: true,
                        )
                      : UserInformationWidget(
                          userName: titularController.titular.nome.toString(),
                          userImage: titularController.titular.foto.toString(),
                          isLoading: false,
                        ),
                ),
              ),
              SizedBox(height: 32.h),
              Hero(
                tag: "creditCard",
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardDetailsPage(),
                      ),
                    );
                  },
                  child: Observer(
                    builder: (_) => titularController.isLoadingCartao
                        ? CreditCardWidget(
                            cardHeight: 300.h,
                            cardWidth: 600.w,
                            isLoading: true,
                            bankName: 'InBolso',
                            cardNumber: '0000',
                            cardLimit: '1000',
                            isRounded: true,
                            imageCreditCard: 'assets/images/master_card.png',
                            cardName: 'USUARIO DA SILVA')
                        : CreditCardWidget(
                            cardHeight: 300.h,
                            cardWidth: 600.w,
                            isLoading: false,
                            bankName: 'InBolso',
                            cardNumber: titularController.cartao.numeroCartao
                                .toString()
                                .substring(15, 19),
                            cardLimit:
                                titularController.cartao.limite.toString(),
                            isRounded: true,
                            imageCreditCard: 'assets/images/master_card.png',
                            cardName:
                                titularController.cartao.nomeCartao.toString()),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Observer(
                builder: (_) => titularController.isLoadingCartao
                    ? CreditCardResumedWidget(
                        isLoading: true,
                        title: "Valor da fatura:",
                        content:
                            "R\$ ${titularController.cartao.valorFatura.toString()}",
                      )
                    : CreditCardResumedWidget(
                        isLoading: false,
                        title: "Valor da fatura:",
                        content:
                            "R\$ ${titularController.cartao.valorFatura.toString()}",
                      ),
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Histórico',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
                ),
              ),
              Expanded(
                  child: Observer(
                builder: (_) => titularController.isLoadingTransacao
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CardTransactionsWidget(
                              idTransacao: index.toString(),
                              isLoading: true,
                              nomeTransacao: 'Transação',
                              logo: 'assets/images/master_card.png',
                              valorTransacao: '500',
                              dataTransacao: '01/01/2021');
                        },
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: titularController.transacoes.length,
                        itemBuilder: (context, index) {
                          return CardTransactionsWidget(
                              isLoading: false,
                              idTransacao: titularController
                                  .transacoes[index].id
                                  .toString(),
                              nomeTransacao: titularController
                                  .transacoes[index].nome
                                  .toString(),
                              logo: titularController.transacoes[index].logo
                                  .toString(),
                              valorTransacao: titularController
                                  .transacoes[index].valor
                                  .toString(),
                              dataTransacao: titularController
                                  .transacoes[index].data
                                  .toString());
                        },
                      ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
