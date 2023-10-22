import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/ticket_view.dart';
import 'package:flutter_application_2/utils/app_info_list.dart';
import 'package:flutter_application_2/utils/app_layout.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/widgets/column_layout.dart';
import 'package:flutter_application_2/widgets/layout_builder_widget.dart';
import 'package:flutter_application_2/widgets/ticket_tabs.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(20),
                  vertical: AppLayout.getHeight(20)),
              children: [
                Gap(AppLayout.getHeight(40)),
                Text(
                  "Tickets",
                  style: Styles.headLineStyle1,
                ),
                Gap(AppLayout.getHeight(20)),
                const AppTicketTabs(
                    firstTab: "Upcoming", secondTab: "Previous"),
                Gap(AppLayout.getHeight(20)),
                Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                  child: TicketView(
                    ticket: ticketList[0],
                    isColor: true,
                  ),
                ),
                const SizedBox(
                  //画一个尺寸框
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    //有行，行中有列
                    children: [
                      const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, //左右分开
                        children: [
                          AppColumnLayout(
                            firstText: "Flutter DB",
                            secondText: "Passenger",
                            alignment: CrossAxisAlignment.start,
                            isColor: true,
                          ),
                          AppColumnLayout(
                            firstText: "5221 364869",
                            secondText: "passport",
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(20)),
                      const AppLayoutBuilderWidget(
                        //布局构造器
                        section: 15,
                        isColor: false,
                        width: 5,
                      ),
                      Gap(AppLayout.getHeight(20)),
                      const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, //左右分开
                        children: [
                          AppColumnLayout(
                            firstText: "364738 28274478",
                            secondText: "Number of E-ticket",
                            alignment: CrossAxisAlignment.start,
                            isColor: true,
                          ),
                          AppColumnLayout(
                            firstText: "B2SG28",
                            secondText: "Booking code",
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(20)),
                      const AppLayoutBuilderWidget(
                        //布局构造器
                        section: 15,
                        isColor: false,
                        width: 5,
                      ),
                      Gap(AppLayout.getHeight(20)),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, //主轴对齐
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/visa.png",
                                    scale: 11,
                                  ),
                                  Text(
                                    " *** 2462",
                                    style: Styles.headLineStyle3,
                                  )
                                ],
                              ),
                              const Gap(5),
                              Text(
                                "Payment method",
                                style: Styles.headLineStyle4,
                              )
                            ],
                          ),
                          const AppColumnLayout(
                            firstText: "\$249.55",
                            secondText: "Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //条形码
                const SizedBox(
                  //画一个尺寸框
                  height: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //边框
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(AppLayout.getHeight(21)),
                        bottomLeft: Radius.circular(AppLayout.getHeight(21))),
                  ),
                  margin: EdgeInsets.only(
                      left: AppLayout.getHeight(15),
                      right: AppLayout.getHeight(15)), //背景色边距
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(20),
                      bottom: AppLayout.getHeight(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(15)),
                    child: ClipRRect(
                      //对原组件进行圆角裁取
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(15)),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: "https://github.com/martinovovo",
                        drawText: false,
                        color: Styles.textColor,
                        width: double.infinity, //双点最大有限
                        height: 70,
                      ),
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(20)),
                Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                  child: TicketView(
                    ticket: ticketList[0],
                    isColor: null,
                  ),
                ),
              ]),
          //两个固定的圆圈
          Positioned(
            left: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                //圆的约束
                //若本身没有父级或者现在堆栈向导本身没有关心孩子的大小，他会尽量的大
                maxRadius: 4, //要让他下来你还要搞一个小部件positioned改变位置
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                //圆的约束
                //若本身没有父级或者现在堆栈向导本身没有关心孩子的大小，他会尽量的大
                maxRadius: 4, //要让他下来你还要搞一个小部件positioned改变位置
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
