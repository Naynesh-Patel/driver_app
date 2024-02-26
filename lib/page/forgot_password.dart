import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:driver_app/constant/assets_path.dart';
import 'package:driver_app/widget/custom_button.dart';
import 'package:driver_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
       body: _body(),
     )
    );
  }

  _body(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(AssetsPath.icLock),
          Text("Forgot Password",style: AppTextStyle.textStyleBold18.copyWith(decoration: TextDecoration.none),),
          const SizedBox(
            height: 30.0,
          ),
          Text("Provide your email and we will send you a link to reset your password",style: AppTextStyle.textStyleRegular14.copyWith(decoration: TextDecoration.none),),
          const SizedBox(
            height: 20.0,
          ),
          const CustomTextField(
            hintText: "Enter your email",
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            buttonText: "Reset Password",
            width: Get.width,
            onTap: () {

          },),
          const SizedBox(
            height: 16.0,
          ),
          _textButton(),

        ],
      ),
    );
  }

  _textButton(){
    return Align(
      alignment: Alignment.center,
      child:TextButton(onPressed: () {
       Get.back();
      }, child: Text("Go Back",style: AppTextStyle.textStyleBold14.copyWith(color: AppColor.themeColor),)),
    );
  }

}
