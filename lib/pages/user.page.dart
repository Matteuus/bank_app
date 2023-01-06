import 'package:bank_app/controllers/titular.controller.dart';
import 'package:bank_app/pages/user_information.page.dart';
import 'package:bank_app/utils/colors.contants.dart';
import 'package:bank_app/widgets/credit_card_resumed.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TitularController titularController = GetIt.I.get<TitularController>();
  bool isTitularExpanded = false;
  bool isContaExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Hero(
              tag: 'userImage',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(256.w),
                child: Image.network(
                  "https://scontent.fjdo10-2.fna.fbcdn.net/v/t39.30808-6/274187521_4912519742159294_4555476668677604608_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qlQvt5q5QroAX_hLDKB&_nc_oc=AQkI7AYlQo_-jFrYtr-8KZVaYp7t8z-Kni3D6XD4cFh6Ytxz7jPwZEgglzWYnFuD6VO2WOirW0yLbIvyqUHPBd6Z&tn=bqWBRZZsSetgIerC&_nc_ht=scontent.fjdo10-2.fna&oh=00_AfDarZJ5hQ4DggmNgn_bj1Fwkvdbu3ZdGQjcTp-ZvEr-Zw&oe=637CA04E",
                  fit: BoxFit.cover,
                  height: 256.h,
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Hero(
              tag: 'userName',
              flightShuttleBuilder: _flightShuttleBuilder,
              child: Observer(builder: (_) {
                return Text(
                  titularController.titular.nome.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
                );
              }),
            ),
            SizedBox(
              height: 16.h,
            ),
            Observer(builder: (_) {
              return Text(
                titularController.titular.email.toString(),
                style: TextStyle(fontSize: 32.sp),
              );
            }),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const UserInformationPage())),
                    child: const ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Titular"),
                      subtitle: Text("Nome, e-mail, telefone..."),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (i, isOpen) => setState(() {
                      isContaExpanded = !isOpen;
                    }),
                    children: [
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return const ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text("Conta"),
                            subtitle: Text("Agência, conta..."),
                          );
                        },
                        body: SizedBox(
                          height: 350.w,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              CreditCardResumedWidget(
                                isLoading: false,
                                title: "Banco",
                                content: titularController
                                    .titular.conta!.nomeBanco
                                    .toString(),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              CreditCardResumedWidget(
                                isLoading: false,
                                title: "Agência",
                                content: titularController
                                    .titular.conta!.agencia
                                    .toString(),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              CreditCardResumedWidget(
                                isLoading: false,
                                title: "Dígito",
                                content: titularController.titular.conta!.digito
                                    .toString(),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              CreditCardResumedWidget(
                                isLoading: false,
                                title: "Conta",
                                content: titularController.titular.conta!.conta
                                    .toString(),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                            ],
                          ),
                        ),
                        isExpanded: isContaExpanded,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SvgPicture.asset(
                'assets/in_bolso.svg',
                height: 64.h,
                width: 64.w,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
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
