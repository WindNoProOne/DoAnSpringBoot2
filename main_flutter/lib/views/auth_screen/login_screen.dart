import 'package:app_mobile/consts/consts.dart';
import 'package:app_mobile/consts/list.dart';
import 'package:app_mobile/views/home_screen/home.dart';
import 'package:app_mobile/widgets_commont/applogo_widgets.dart';
import 'package:app_mobile/widgets_commont/bg_widget.dart';
import 'package:app_mobile/widgets_commont/custom_textfield.dart';
import 'package:app_mobile/widgets_commont/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;

  void _showSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void _login() {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar('Please fill in all fields.');
      return;
    }
    Get.to(() => const Home());
  }

  @override
  Widget build(BuildContext context) {
    return dgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Login in to $appname"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(13)
                  .make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(
                    controller: emailController,
                    hint: emailHint,
                    title: email,
                  ),
                  customTextField(
                    controller: passwordController,
                    hint: passwordHint,
                    title: password,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: _login,
                  ).box.width(context.screenHeight - 50).make(),
                  15.heightBox,
                  createNewAccoutn.text.color(fontGrey).make(),
                  15.heightBox,
                  ourButton(
                    color: golden,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(() => const LoginScreen());
                    },
                  ).box.width(context.screenHeight - 50).make(),
                  15.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(
                          sociallconList[index],
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
