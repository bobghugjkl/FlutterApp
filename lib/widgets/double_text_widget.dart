import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  const AppDoubleTextWidget(
      {Key? key, required this.bigText, required this.smallText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //航班和查看一切
      mainAxisAlignment: MainAxisAlignment.spaceBetween, //设置格式
      children: [
        Text(
          bigText,
          style: Styles.headLineStyle2,
        ),
        InkWell(
            onTap: () {
              //接受一个没有名字的函数
              print("You are tapped");
            },
            child: Text(
              smallText,
              style: Styles.textStyle.copyWith(color: Styles.primaryColor),
            ))
        //也可以对之前的设置做一些个性化的改动,并且加上了一些小部件做一些鼠标监听
      ],
    );
  }
}
