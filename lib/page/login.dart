import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/constant/assets_path.dart';
import 'package:driver_app/page/forgot_password.dart';
import 'package:driver_app/page/home.dart';
import 'package:driver_app/widget/custom_button.dart';
import 'package:driver_app/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColor.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logo(),
              const SizedBox(
                height: 50.0,
              ),
              _widgetInputField(),
            ],
          ),
        ),
        bottomNavigationBar: _widgetBottomBarItems(),
      ),
    );
  }

  Widget _logo(){
    return Center(child: Image.asset(AssetsPath.driverLogo,width: 100,));
  }

  Widget _widgetInputField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextField(
            hintText: 'Email',
          ),
          const SizedBox(
            height: 16.0,
          ),
          const CustomTextField(
            hintText: 'Password',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // _widgetTextButton(text: "Create New Account",onPressed: () {
              //
              // },),
              _widgetTextButton(text: "Forgot Password?",onPressed: () {
                  Get.to(const ForgotPassword());
              },),
            ],
          ),
        ],
      ),
    );
  }

  Widget _widgetBottomBarItems(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            buttonText: "Login",
            width: Get.width,
            onTap: (){
              Get.to(const Home());
            },
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }


  Widget _widgetTextButton({text,required void Function()? onPressed}){
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            textStyle: AppTextStyle.textStyleBold12
        ),
        onPressed:onPressed, child: Text("$text",style:AppTextStyle.textStyleRegular12,));
  }

}
