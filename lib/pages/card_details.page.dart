import 'package:bank_app/controllers/titular.controller.dart';
import 'package:bank_app/utils/colors.contants.dart';
import 'package:bank_app/widgets/credit_card.widget.dart';
import 'package:bank_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CardDetailsPage extends StatefulWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  final TitularController titularController = GetIt.I.get<TitularController>();
  double _valueLimite = 0;

  @override
  void initState() {
    super.initState();
    _valueLimite = double.parse(titularController.cartao.limite.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'creditCard',
              flightShuttleBuilder: _flightShuttleBuilder,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Observer(
                    builder: (_) => titularController.isLoadingCartao
                        ? CreditCardWidget(
                            cardHeight: 500.h,
                            cardWidth: ScreenUtil().screenWidth,
                            isLoading: true,
                            bankName: 'InBolso',
                            cardNumber: titularController.cartao.numeroCartao
                                .toString()
                                .substring(15, 19),
                            cardLimit:
                                titularController.cartao.limite.toString(),
                            isRounded: false,
                            imageCreditCard: 'assets/images/master_card.png',
                            cardName:
                                titularController.cartao.nomeCartao.toString())
                        : CreditCardWidget(
                            cardHeight: 500.h,
                            cardWidth: ScreenUtil().screenWidth,
                            isLoading: false,
                            bankName: 'InBolso',
                            cardNumber: titularController.cartao.numeroCartao
                                .toString()
                                .substring(15, 19),
                            cardLimit:
                                titularController.cartao.limite.toString(),
                            isRounded: false,
                            imageCreditCard: 'assets/images/master_card.png',
                            cardName: titularController.cartao.nomeCartao
                                .toString())),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              child: Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroungBasicCreditCardColor,
                  borderRadius: BorderRadius.circular(16.h),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Valor fatura:",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'R\$ ${titularController.cartao.valorFatura} ',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fechamento da fatura:",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            titularController.cartao.fechamentoFatura
                                .toString(),
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              child: Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroungBasicCreditCardColor,
                  borderRadius: BorderRadius.circular(16.h),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Limite utilizado:",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              'R\$ ${titularController.cartao.limiteUtilizado} ',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Saldo:",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              'R\$ ${titularController.cartao.saldo} ',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Limite:",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'R\$ 2000 ',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: kPrimaryColor,
                        value: _valueLimite,
                        min: double.parse(titularController
                            .cartao.limiteUtilizado
                            .toString()),
                        max: double.parse(
                            titularController.cartao.limiteTotal.toString()),
                        divisions: int.parse(
                                titularController.cartao.limite.toString())
                            .round(),
                        label: _valueLimite.round().toString(),
                        onChanged: (newValue) {
                          setState(() {
                            _valueLimite = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Observer(
              builder: (_) => _valueLimite !=
                      double.parse(titularController.cartao.limite.toString())
                  ? Padding(
                      padding: EdgeInsets.only(left: 32.w, right: 32.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Novo Limite: R\$ ${_valueLimite.round()} ',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            text: 'Cancelar',
                            outline: true,
                            onTap: () {
                              setState(() {
                                _valueLimite = double.parse(
                                    titularController.cartao.limite.toString());
                              });
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            text: 'Confirmar',
                            onTap: () {
                              var novoSaldo = _valueLimite.round() -
                                  int.parse(titularController
                                      .cartao.limiteUtilizado
                                      .toString());
                              titularController.alterarLimite(
                                  novoSaldo.toString(),
                                  _valueLimite.round().toString());
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

Widget _flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}
