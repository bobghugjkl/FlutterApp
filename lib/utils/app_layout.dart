//设置所有的大小文件
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    //通过上下文传递构建

    return MediaQuery.of(context).size; //从这里获取大小
  }

  //  不需要传递上下文来实现
  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  //创造一个函数让他可以动态地搞到高度和宽度,解决溢出问题
  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels; //比例计算
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels; //比例计算
    return getScreenWidth() / x;
  }
}
