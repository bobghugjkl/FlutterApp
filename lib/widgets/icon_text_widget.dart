import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text; //为了更好的动态表示,这样无论传送什么都可以表示
  const AppIconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getWidth(12),
          horizontal: AppLayout.getHeight(20)), //这个是控制大小的
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFBFC2DF),
          ),
          Gap(AppLayout.getWidth(10)), //防止两个挨得太近，它既可以防止上下也可以防止左右
          Text(
            text,
            style: Styles.textStyle,
          )
        ],
      ),
    );
  }
}
