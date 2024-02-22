import 'package:app_mobile/consts/consts.dart';
import 'package:app_mobile/consts/list.dart';
import 'package:app_mobile/views/category_screen/categoryDetails_screen.dart';
import 'package:app_mobile/widgets_commont/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return dgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImage[index],
                    height: 140,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make(),
                ],
              ).box.white.rounded.clip(Clip.antiAlias).make().onTap(() {
                Get.to(
                    () => CategoryDetailsScreen(title: categoriesList[index]));
              });
            },
          ),
        ),
      ),
    );
  }
}
