//主屏幕
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/hotel_screen.dart';
import 'package:flutter_application_2/screens/ticket_view.dart';
import 'package:flutter_application_2/utils/app_info_list.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/widgets/double_text_widget.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20), //水平对称
            child: Column(
              children: [
                const Gap(40), //顶部空间
                Row(
                  //行布局
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //应用和交叉轴对齐
                      children: [
                        Text(
                          "Good Moring",
                          style: Styles.headLineStyle3,
                        ),
                        const Gap(5), //不需要提供高度和宽度了，较为方便
                        Text(
                          "Book Tickets",
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ), //一个组件，让他们垂直布局
                    Container(
                      height: 50,
                      width: 50, //宽度和高度让它可以显示
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), //边界半径
                          image: const DecorationImage(
                              fit: BoxFit
                                  .fitHeight, //让它可以有一些其他的类似自适应的东西，当然需要宽度和高度，因为在容器中
                              image: AssetImage("assets/images/img_1.png"))),
                    )
                  ],
                ),
                const Gap(25), //插件，需要先导入
                Container(
                  //包装起来方便使用样式
                  decoration: BoxDecoration(
                      //装饰总是跟在Box里面
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12), //想做对称的
                  child: Row(
                    //文本搜索框
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(
                    bigText: "Upcoming Flight", smallText: "View all"),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            //轮播图
            scrollDirection: Axis.horizontal, //水平滚动
            padding: const EdgeInsets.only(left: 20), //设置之间的东西填充
            child: Row(
              //一行为单位
              children: ticketList
                  .map((singleTicket) => TicketView(
                        ticket: singleTicket,
                        isColor: null,
                      ))
                  .toList(),
            ),
          ),
          const Gap(15),
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20), //这里是利用container小组件做的一个对称的填充
              child: const AppDoubleTextWidget(
                bigText: "Hotels",
                smallText: "View all",
              )),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, //水平滚动
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              //一行为单位
              children: hotelList
                  .map((singlehotel) => HotelScreen(hotel: singlehotel))
                  .toList(), //hotel那个位置必须与那个类中命名的一致
            ),
          ),
        ],
      ), //列格式布局+行布局+...
    );
  }
}
