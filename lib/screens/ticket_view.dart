import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_layout.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/widgets/column_layout.dart';
import 'package:flutter_application_2/widgets/thick_container.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

//工单视图
class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor; //最终的颜色
  const TicketView({Key? key, required this.ticket, required this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85, //将此逻辑移动到不同的文件类就可以使用了
      height: AppLayout.getHeight(
          GetPlatform.isAndroid == true ? 167 : 169), //特殊情况特殊处理
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)), //整体右边界间隔
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //显示卡的蓝色部分
          Container(
            decoration: BoxDecoration(
                //一般都用盒子来装饰
                color: isColor == null
                    ? const Color(0xFF526799)
                    : Colors.white, //三目运算符，看看输入的iscolor，如果有就是白色，没有就是原始的颜色
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)), //设置边角
                )),
            padding: EdgeInsets.all(AppLayout.getHeight(16)),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    ticket['from']['code'],
                    style: isColor == null
                        ? Styles.headLineStyle3.copyWith(color: Colors.white)
                        : Styles.headLineStyle3.copyWith(color: Colors.black),
                  ),

                  Expanded(child: Container()), //布局，推到远处
                  const ThickContainer(
                    isColor: true,
                  ),
                  Expanded(
                      child: Stack(//加一个小部件，目的是为了让两个图标在一起覆盖什么的
                          children: [
                    SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            //可以做到自适应根据不同的宽度
                            print(
                                "The width is ${constraints.constrainWidth()}"); //可以打印宽度
                            return Flex(
                                //可以放很多child在这儿
                                direction: Axis.horizontal, //访问水平访问点
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, //水平分布“-”
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    (constraints.constrainWidth() / 6).floor(),
                                    (index) => SizedBox(
                                          width: 3,
                                          height: 1,
                                          child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: isColor == null
                                                      ? Colors.grey.shade300
                                                      : Colors.white)),
                                        )) //中间有几个并且以什么方式返回
                                );
                          },
                        )),
                    Center(
                      //一般是先写完里面的然后再用外面的组件
                      child: Transform.rotate(
                        angle: 1.5,
                        child: Icon(
                          Icons.local_airport_rounded,
                          color: isColor == null
                              ? Colors.white
                              : Color(0xFF8ACCF7),
                        ),
                      ),
                    ),
                  ])), //其实是平均分这一行

                  const ThickContainer(
                    isColor: true,
                  ),

                  Expanded(child: Container()), //将圆圈推到中间
                  Text(
                    ticket['to']['code'],
                    style: isColor == null
                        ? Styles.headLineStyle3.copyWith(color: Colors.white)
                        : Styles.headLineStyle3
                            .copyWith(color: Colors.black), //副本覆盖格式
                  )
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //主要访问对齐
                children: [
                  SizedBox(
                    width: AppLayout.getWidth(100),
                    child: Text(
                      ticket['from']['name'],
                      style: isColor == null
                          ? Styles.headLineStyle4.copyWith(color: Colors.white)
                          : Styles.headLineStyle4
                              .copyWith(color: Colors.grey.shade500),
                    ),
                  ),
                  Text(
                    ticket['flying_time'],
                    style: isColor == null
                        ? Styles.headLineStyle4.copyWith(color: Colors.white)
                        : Styles.headLineStyle4.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(100),
                    child: Text(
                      ticket['to']['name'],
                      textAlign: TextAlign.end, //文本对齐
                      style: isColor == null
                          ? Styles.headLineStyle4.copyWith(color: Colors.white)
                          : Styles.headLineStyle4
                              .copyWith(color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          //显示卡的橙色部分
          Container(
            color: isColor == null ? Styles.orangeColor : Colors.white,
            child: Row(
              children: [
                SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.grey.shade200
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppLayout.getWidth(10)),
                            bottomRight:
                                Radius.circular(AppLayout.getWidth(10)),
                          )),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0), //一共有几个
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              (constraints.constrainWidth() / 15)
                                  .floor(), //宽度的限制,可以加很多减号
                              (index) => SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: isColor == null
                                                ? Colors.white
                                                : Colors.grey.shade300)),
                                  )),
                        );
                      },
                    ),
                  ),
                ), //让它到两边
                SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.grey.shade200
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getWidth(10)),
                            bottomLeft: Radius.circular(AppLayout.getWidth(10)),
                          )),
                    )),
              ],
            ),
          ),
          //橙色下半部分
          Container(
            decoration: BoxDecoration(
                //一般都用盒子来装饰
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      AppLayout.getWidth(isColor == null ? 21 : 0)),
                  bottomRight: Radius.circular(
                      AppLayout.getWidth(isColor == null ? 21 : 0)), //设置边角
                )),
            padding: const EdgeInsets.only(
                left: 16, top: 10, right: 16, bottom: 16), //调整间距
            child: Column(children: [
              Row(
                //可以帮我们找到对应的空间并将他们居中并对齐
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //规定整体的属性
                children: [
                  AppColumnLayout(
                    firstText: ticket['departure_time'],
                    secondText: "Date",
                    alignment: CrossAxisAlignment.start,
                    isColor: isColor, //让他不是白色可以显示
                  ),
                  AppColumnLayout(
                    firstText: ticket['date'],
                    secondText: "Departure time",
                    alignment: CrossAxisAlignment.center,
                    isColor: isColor, //让他不是白色可以显示,这里是抓住过去的那个
                  ),
                  AppColumnLayout(
                    firstText: ticket["number"].toString(),
                    secondText: "Number",
                    alignment: CrossAxisAlignment.center,
                    isColor: isColor, //让他不是白色可以显示
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
