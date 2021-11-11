import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CardTransactionsWidget extends StatelessWidget {
  final String nomeTransacao;
  final String valorTransacao;
  final String dataTransacao;
  final String logo;
  final bool isLoading;
  const CardTransactionsWidget(
      {Key? key,
      required this.logo,
      required this.nomeTransacao,
      required this.isLoading,
      required this.valorTransacao,
      required this.dataTransacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Image.asset(
              logo,
              fit: BoxFit.cover,
              width: 50.w,
              height: 50.h,
            ),
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.transparent,
          highlightColor: kPrimaryColor,
          child: Text(nomeTransacao,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        subtitle: Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: kPrimaryColor,
            child: Text(dataTransacao)),
        trailing: Shimmer.fromColors(
          baseColor: Colors.transparent,
          highlightColor: kPrimaryColor,
          child: Text(
            'R\$ $valorTransacao',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            logo,
            fit: BoxFit.cover,
            width: 50.w,
            height: 50.h,
          ),
        ),
        title: Text(nomeTransacao,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(dataTransacao),
        trailing: Text(
          'R\$ $valorTransacao',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
