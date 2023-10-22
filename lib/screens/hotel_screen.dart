import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_layout.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel})
      : super(key: key); //构造函数接收map

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5), //设置外边界
      decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2, //模糊半径
              spreadRadius: 1, //传播半径
            )
          ]), //整体上色和边界设置

      child: Column(children: [
        Container(
          //图片
          height: AppLayout.getHeight(180),
          decoration: BoxDecoration(
              color: Styles.primaryColor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/${hotel['image']}"))),
        ),
        const Gap(10),
        Text(
          hotel['place'].toString(),
          style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
        ),
        const Gap(5),
        Text(
          hotel['destination'].toString(),
          style: Styles.headLineStyle3.copyWith(color: Colors.white),
        ),
        const Gap(5),
        Text(
          '\$${hotel['price']}'.toString(), //反斜杠后面才可以显示
          style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
        ),
      ]),
    );
  }
}
