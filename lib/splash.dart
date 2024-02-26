import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/assets_path.dart';
import 'package:driver_app/page/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.25),
      decoration: const BoxDecoration(
        color: AppColor.themeColor
      ),
      child: Image.asset(AssetsPath.driverLogo),
    );
  }

  _timer(){
    Future.delayed(const Duration(seconds: 3),() {
      Get.off(const Login());
    },);
  }

}
