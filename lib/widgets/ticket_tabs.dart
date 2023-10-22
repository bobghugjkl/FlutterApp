import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs(
      {Key? key, required this.firstTab, required this.secondTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      //为了防止无效挤压，通常将它放到一个小部件里面
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          //一个装饰
          borderRadius:
              BorderRadius.circular(AppLayout.getHeight(50)), //不管是什么动态的总是对的
          color: const Color(0xFFF4F6FD),
        ),
        child: Row(
          //一行
          children: [
            //里面又会有容器
            //机票行
            Container(
              width: size.width * .44, //拿出百分之44
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                //一个装饰
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(
                        AppLayout.getHeight(50))), //不管是什么动态的总是对的,但这里必须做相反的事情
                color: Colors.white,
              ),
              child: Center(
                child: Text(firstTab),
              ),
            ),
            //hotels
            Container(
              width: size.width * .44, //拿出百分之44
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                //一个装饰
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(
                        AppLayout.getHeight(50))), //不管是什么动态的总是对的,但这里必须做相反的事情
                color: Colors.transparent, //较透明
              ),
              child: Center(
                child: Text(secondTab),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
