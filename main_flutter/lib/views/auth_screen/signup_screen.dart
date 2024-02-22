import 'package:app_mobile/consts/consts.dart';
import 'package:app_mobile/views/auth_screen/login_screen.dart';
import 'package:app_mobile/widgets_commont/custom_date.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/controller/auth_controller.dart';
import 'package:app_mobile/widgets_commont/applogo_widgets.dart';
import 'package:app_mobile/widgets_commont/bg_widget.dart';
import 'package:app_mobile/widgets_commont/custom_textfield.dart';
import 'package:app_mobile/widgets_commont/our_button.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheck = false;
  var controller = Get.put(AuthController());

  // Text Controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var retypepasswordController = TextEditingController();
  var dateController = TextEditingController();

  // Tạo hàm để đăng ký
  void _register() async {
    String username = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String retypePassword = retypepasswordController.text.trim();
    // DateTime? birthday = dateController.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        retypePassword.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields.");
      return;
    }

    if (password != retypePassword) {
      Get.snackbar("Error", "Passwords do not match.");
      return;
    }

    String? result = await controller.register(
      username,
      email,
      password,
      "",
      phone,
    );

    if (result == 'success') {
      // Nếu đăng ký thành công, bạn có thể chuyển người dùng đến màn hình khác hoặc thực hiện các hành động khác
      Get.to(() => const LoginScreen());
    } else {
      // Nếu đăng ký thất bại, hiển thị thông báo lỗi
      Get.snackbar("Error", "Registration failed. Please try again.");
    }
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
            "Signin the $appname"
                .text
                .fontFamily(regular)
                .white
                .size(13)
                .make(),
            10.heightBox,
            Column(
              children: [
                customTextField(
                  hint: nameHint,
                  title: name,
                  controller: nameController,
                ),
                customTextField(
                  hint: emailHint,
                  title: email,
                  controller: emailController,
                ),
                customTextField(
                  hint: phoneHint,
                  title: phone,
                  controller: phoneController,
                ),
                customTextField(
                  hint: passwordHint,
                  title: password,
                  controller: passwordController,
                ),
                customTextField(
                  hint: passwordHint,
                  title: retypepassword,
                  controller: retypepasswordController,
                ),
                CustomDatePicker(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPassword.text.make(),
                  ),
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                      checkColor: redColor,
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue ?? false;
                        });
                      },
                    ),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  fontFamily: "YourFontFamily",
                                  color: fontGrey),
                            ),
                            TextSpan(
                              text: termAndCound,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor),
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(
                                  fontFamily: "YourFontFamily",
                                  color: fontGrey),
                            ),
                            TextSpan(
                              text: privacyPolycy,
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                15.heightBox,
                ourButton(
                  color: isCheck == true ? redColor : lightGrey,
                  title: signup,
                  textColor: whiteColor,
                  onPress: _register, // Gọi hàm đăng ký khi nút được nhấn
                ).box.width(context.screenHeight - 50).make(),
                15.heightBox,
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(fontFamily: regular, color: fontGrey),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: regular, color: redColor),
                      )
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                })
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
    ));
  }
}
