import 'package:app_mobile/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons({width, height, String? title, icon, onPress}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.rounded.white.size(width, height).make(),
  );
}
