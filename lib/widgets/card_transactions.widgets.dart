import 'package:bank_app/utils/colors.contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CardTransactionsWidget extends StatelessWidget {
  final String nomeTransacao;
  final String valorTransacao;
  final String dataTransacao;
  final String idTransacao;
  final String logo;
  final bool isLoading;
  const CardTransactionsWidget(
      {Key? key,
      required this.logo,
      required this.idTransacao,
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
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(16.h),
                child: SizedBox(
                  height: 350.h,
                  child: Column(
                    children: [
                      Divider(
                        indent: 256.w,
                        endIndent: 256.w,
                        color: Colors.black,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Text(
                            'Detalhes da transação',
                            style: TextStyle(
                                fontSize: 32.sp, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              size: 50.w,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Image.network(
                            logo,
                            fit: BoxFit.cover,
                            width: 150.w,
                            height: 150.h,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                idTransacao,
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                nomeTransacao,
                                style: TextStyle(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Data: $dataTransacao',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Valor: R\$ $valorTransacao',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: ListTile(
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
        ),
      );
    }
  }
}
