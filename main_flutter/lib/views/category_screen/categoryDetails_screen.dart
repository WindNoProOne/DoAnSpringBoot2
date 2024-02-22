import 'package:app_mobile/consts/consts.dart';
import 'package:app_mobile/views/category_screen/item_details.dart';
import 'package:app_mobile/widgets_commont/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String? title;
  const CategoryDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              ),

              20.heightBox,
              //Item Container
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP1,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        //Title
                        10.heightBox,
                        "Laptop 4GB/64GB"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        //Price
                        10.heightBox,
                        "\$600"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(16)
                            .make(),
                        10.heightBox,
                      ],
                    )
                        .box
                        .white
                        .margin(
                          const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                        )
                        .roundedSM
                        .outerShadowSm
                        .padding(const EdgeInsets.all(8))
                        .make()
                        .onTap(
                      () {
                        Get.to(
                          () => const ItemDtails(title: "Dummy Item"),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
