import 'package:app_mobile/consts/consts.dart';
import 'package:app_mobile/consts/list.dart';
import 'package:app_mobile/views/profile_screen/components/details_cart.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/widgets_commont/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //Edit Profile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: const Icon(Icons.edit, color: whiteColor).onTap(() {}),
                ),
              ),

              //User Detai;s Section

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    //Avata
                    Image.asset(imgProfile, width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    //Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dumy User".text.fontFamily(semibold).white.make(),
                          5.heightBox,
                          "User@gamail.com".text.white.make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor),
                      ),
                      onPressed: () {},
                      child: logout.text
                          .fontFamily(semibold)
                          .white
                          .size(13)
                          .make(),
                    )
                  ],
                ),
              ),

              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCart(
                    count: "00",
                    title: "In Yoor Cart",
                    width: context.screenWidth / 3.4,
                  ),
                  detailsCart(
                    count: "10",
                    title: "In Yoor Cart",
                    width: context.screenWidth / 3.4,
                  ),
                  detailsCart(
                    count: "100",
                    title: "In Yoor Cart",
                    width: context.screenWidth / 3.4,
                  ),
                ],
              ),

              //Button Secction
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(color: lightGrey);
                },
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 22,
                    ),
                    title: profileButtonList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .margin(const EdgeInsets.all(12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .shadow
                  .make()
                  .box
                  .color(redColor)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
