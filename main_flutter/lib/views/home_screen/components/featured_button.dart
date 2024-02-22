import 'package:app_mobile/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(icon, width: 40, fit: BoxFit.fill),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.white.padding(const EdgeInsets.all(8)).roundedSM.outerShadow.make();
}
