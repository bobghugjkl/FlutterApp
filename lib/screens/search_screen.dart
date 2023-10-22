import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_layout.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/widgets/double_text_widget.dart';
import 'package:flutter_application_2/widgets/icon_text_widget.dart';
import 'package:flutter_application_2/widgets/ticket_tabs.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context); //获取大小
    return Scaffold(
      //还是脚手架，便于配色什么的
      backgroundColor: Styles.bgColor,
      body: ListView(
        //可以用列表来实现
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(20),
            vertical: AppLayout.getHeight(20)), //做一个左填充和右填充，对称水平和垂直水平
        children: [
          Gap(AppLayout.getHeight(40)), //正好也运用了这个，动态
          Text(
            "What are\n you looking for?",
            style: Styles.headLineStyle1
                .copyWith(fontSize: AppLayout.getHeight(35)),
          ),
          Gap(AppLayout.getHeight(20)),
          //有边框，在容器里进行
          const AppTicketTabs(
            firstTab: "AirLine Tickets",
            secondTab: "Hotels",
          ),
          //完成第一行
          Gap(AppLayout.getHeight(25)),
          const AppIconText(
              icon: Icons.flight_takeoff_rounded, text: "Departure"),
          Gap(AppLayout.getHeight(20)),
          const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
          Gap(AppLayout.getHeight(25)),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getWidth(18),
                  horizontal: AppLayout.getHeight(15)), //这个是控制大小的
              decoration: BoxDecoration(
                color: Color(0xD91130CE),
                borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
              ),
              child: Center(
                child: Text(
                  "find tickets",
                  style: Styles.textStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              )),
          Gap(AppLayout.getHeight(15)),
          const AppDoubleTextWidget(
              bigText: "Upcoming Flights", smallText: "View all"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //对其主要访问,有自动空间
            children: [
              Container(
                //父容器所以需要很多东西
                height: AppLayout.getHeight(425),
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(15),
                    vertical: AppLayout.getWidth(15)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        AppLayout.getHeight(20)), //子项与父项相同的边框看起来会更好
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(children: [
                  Container(
                    height: AppLayout.getHeight(190),
                    decoration: BoxDecoration(
                        //边界半径
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(12)),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/sit.jpg"))),
                  ),
                  Gap(AppLayout.getHeight(12)),
                  Text(
                    "20% discount on the early booking of this flight. Don't miss",
                    style: Styles.headLineStyle2,
                  ),
                ]),
              ),
              Column(
                //列表
                children: [
                  Stack(
                    //为了实现效果整合到一个堆栈小部件里面
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: AppLayout.getHeight(200),
                        decoration: BoxDecoration(
                            color: Color(0xFF3AB8B8),
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(18))),
                        padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(15),
                            horizontal: AppLayout.getHeight(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, //对称
                            children: [
                              Text(
                                "Discount\nfor survey",
                                style: Styles.headLineStyle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                "Take the survey about our services and get discount",
                                style: Styles.headLineStyle2.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ]),
                      ),
                      //在部件中有位置，可以自由移动
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(
                              30)), //不仅可以填充，还可以让边框更显眼，占的面积更大
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 18, color: Color(0xFF189999)), //边框颜色
                            //内部颜色
                            color: Colors.transparent,
                          ), //透明，可以衬出底部颜色
                        ),
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(12)),
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(210),
                    padding: EdgeInsets.symmetric(
                        vertical: AppLayout.getHeight(15),
                        horizontal: AppLayout.getHeight(15)),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(18)), //整体移动
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(children: [
                      Text(
                        "Take love",
                        style: Styles.headLineStyle2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center, //对齐
                      ),
                      Gap(AppLayout.getHeight(5)),
                      RichText(
                          //富文本
                          text: const TextSpan(children: [
                        TextSpan(text: '😍', style: TextStyle(fontSize: 28)),
                        TextSpan(text: '🥳', style: TextStyle(fontSize: 40)),
                        TextSpan(text: '😘', style: TextStyle(fontSize: 28)),
                      ]))
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
