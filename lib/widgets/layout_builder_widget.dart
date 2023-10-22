import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final bool? isColor;
  final int section; //我们希望它是动态的
  final double width;
  const AppLayoutBuilderWidget(
      {Key? key, this.isColor, required this.section, this.width = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //可以做到自适应根据不同的宽度
        print("The width is ${constraints.constrainWidth()}"); //可以打印宽度
        return Flex(
            //可以放很多child在这儿
            direction: Axis.horizontal, //访问水平访问点
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //水平分布“-”
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                (constraints.constrainWidth() / section).floor(),
                (index) => SizedBox(
                      width: width,
                      height: 1,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: isColor == null
                                  ? Colors.white
                                  : Colors.black)),
                    )) //中间有几个并且以什么方式返回
            );
      },
    );
  }
}
